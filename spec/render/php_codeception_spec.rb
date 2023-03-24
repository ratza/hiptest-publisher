require_relative '../spec_helper'
require_relative '../render_shared'

describe 'Codeception rendering' do
  include_context "shared render"
  it_behaves_like 'a BDD renderer', uid_should_be_in_outline: false do
    let(:language) {'php'}
    let(:framework) {'codeception'}

    let(:rendered_actionwords) {
      [
        '<?php',
        '',
        'namespace Tests;',
        '',
        'use Behat\Gherkin\Node\TableNode;',
        'use Codeception\Actor;',
        'use PHPUnit\Framework\IncompleteTestError;',
        '',
        'class BddTester extends Actor',
        '{',
        '  /**',
        '   * @Given the color :color',
        '   */',
        '  public function theColorColor($color)',
        '  {',
        '    throw new IncompleteTestError(\'Action `theColorColor` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @When you mix colors',
        '   */',
        '  public function youMixColors()',
        '  {',
        '    throw new IncompleteTestError(\'Action `youMixColors` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @Then you obtain :color',
        '   */',
        '  public function youObtainColor($color)',
        '  {',
        '    throw new IncompleteTestError(\'Action `youObtainColor` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @Then you cannot play croquet',
        '   */',
        '  public function youCannotPlayCroquet()',
        '  {',
        '    throw new IncompleteTestError(\'Action `youCannotPlayCroquet` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @Given I am on the :site home page',
        '   */',
        '  public function iAmOnTheSiteHomePage($site, $freeText)',
        '  {',
        '    throw new IncompleteTestError(\'Action `iAmOnTheSiteHomePage` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @When the following users are available on :site',
        '   */',
        '  public function theFollowingUsersAreAvailableOnSite($site, TableNode $datatable)',
        '  {',
        '    throw new IncompleteTestError(\'Action `theFollowingUsersAreAvailableOnSite` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @Given an untrimed action word',
        '   */',
        '  public function anUntrimedActionWord()',
        '  {',
        '    throw new IncompleteTestError(\'Action `anUntrimedActionWord` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @Given the :order of :parameters is weird :p0 :p1',
        '   */',
        '  public function theOrderOfParametersIsWeird($order, $parameters, $p0, $p1)',
        '  {',
        '    throw new IncompleteTestError(\'Action `theOrderOfParametersIsWeird` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @Given I login on :site :username',
        '   */',
        '  public function iLoginOn($site, $username)',
        '  {',
        '    throw new IncompleteTestError(\'Action `iLoginOn` is not defined.\');',
        '  }',
        '',
        '  /**',
        '   * @Given I have some :number',
        '   */',
        '  public function iHaveSomeNumber($number)',
        '  {',
        '    throw new IncompleteTestError(\'Action `iHaveSomeNumber` is not defined.\');',
        '  }',
        '}'
      ].join("\n")
    }

    let(:actionword_without_quotes_in_regexp_rendered) {
      [
        '/**',
        ' * @Given the color :color',
        ' */',
        'public function theColorColor($color)',
        '{',
        '  throw new IncompleteTestError(\'Action `theColorColor` is not defined.\');',
        '}'
      ].join("\n")
    }

    let(:rendered_free_texted_actionword) {[
      'public function theFollowingUsersAreAvailable($freeText)',
      '{',
      '  if (method_exists($this->I, __FUNCTION__)) {',
      '    $this->I->theFollowingUsersAreAvailable($freeText);',
      '    return;',
      '  }',
      '',
      '  throw new IncompleteTestError(\'Action `theFollowingUsersAreAvailable` is not defined. Implement `public function theFollowingUsersAreAvailable($freeText)` in `BddTester`.\');',
      '}'].join("\n")}

    let(:rendered_datatabled_actionword) {[
      'public function theFollowingUsersAreAvailable(TableNode $datatable)',
      '{',
      '  if (method_exists($this->I, __FUNCTION__)) {',
      '    $this->I->theFollowingUsersAreAvailable($datatable);',
      '    return;',
      '  }',
      '',
      '  throw new IncompleteTestError(\'Action `theFollowingUsersAreAvailable` is not defined. Implement `public function theFollowingUsersAreAvailable($datatable)` in `BddTester`.\');',
      '}'].join("\n")}

    let(:rendered_empty_scenario) { "\nScenario: Empty Scenario\n" }

    context 'Actionwords as step definitions' do
      let(:meta) {""}
      let(:options) {
        context_for(
          only: "step_definitions",
          language: language,
          framework: framework,
          meta: meta,
          )
      }

      let(:node_to_render) {project.children[:actionwords]}

      context 'meta can be used to configure codecption template' do
        let(:meta) {
          [
            'codeception_suite_name:Acceptance',
            'codeception_actor_suffix:Actor',
            'codeception_support_namespace:Tests\\_support',
          ].join(',')
        }

        let(:rendered_actionwords) {
          [
            '<?php',
            '',
            'namespace Tests\_support;',
            '',
            'use Behat\Gherkin\Node\TableNode;',
            'use Codeception\Actor;',
            'use PHPUnit\Framework\IncompleteTestError;',
            '',
            'class AcceptanceActor extends Actor',
            '{',
            '  /**',
            '   * @Given the color :color',
            '   */',
            '  public function theColorColor($color)',
            '  {',
            '    throw new IncompleteTestError(\'Action `theColorColor` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @When you mix colors',
            '   */',
            '  public function youMixColors()',
            '  {',
            '    throw new IncompleteTestError(\'Action `youMixColors` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @Then you obtain :color',
            '   */',
            '  public function youObtainColor($color)',
            '  {',
            '    throw new IncompleteTestError(\'Action `youObtainColor` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @Then you cannot play croquet',
            '   */',
            '  public function youCannotPlayCroquet()',
            '  {',
            '    throw new IncompleteTestError(\'Action `youCannotPlayCroquet` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @Given I am on the :site home page',
            '   */',
            '  public function iAmOnTheSiteHomePage($site, $freeText)',
            '  {',
            '    throw new IncompleteTestError(\'Action `iAmOnTheSiteHomePage` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @When the following users are available on :site',
            '   */',
            '  public function theFollowingUsersAreAvailableOnSite($site, TableNode $datatable)',
            '  {',
            '    throw new IncompleteTestError(\'Action `theFollowingUsersAreAvailableOnSite` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @Given an untrimed action word',
            '   */',
            '  public function anUntrimedActionWord()',
            '  {',
            '    throw new IncompleteTestError(\'Action `anUntrimedActionWord` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @Given the :order of :parameters is weird :p0 :p1',
            '   */',
            '  public function theOrderOfParametersIsWeird($order, $parameters, $p0, $p1)',
            '  {',
            '    throw new IncompleteTestError(\'Action `theOrderOfParametersIsWeird` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @Given I login on :site :username',
            '   */',
            '  public function iLoginOn($site, $username)',
            '  {',
            '    throw new IncompleteTestError(\'Action `iLoginOn` is not defined.\');',
            '  }',
            '',
            '  /**',
            '   * @Given I have some :number',
            '   */',
            '  public function iHaveSomeNumber($number)',
            '  {',
            '    throw new IncompleteTestError(\'Action `iHaveSomeNumber` is not defined.\');',
            '  }',
            '}'
          ].join("\n")
        }

        it 'overrides' do
          expect(rendered).to eq(rendered_actionwords)
        end
      end

      context 'meta can be used to configure php template' do
        context 'all' do
          let(:meta) { "php_file_header:declare(strict_types=1);\n/** Test License */" }

          let(:rendered_actionwords) {
            [
              '<?php',
              'declare(strict_types=1);',
              '/** Test License */',
              '',
              'namespace Tests;',
              '',
              'use Behat\Gherkin\Node\TableNode;',
              'use Codeception\Actor;',
              'use PHPUnit\Framework\IncompleteTestError;',
              '',
              'class BddTester extends Actor',
            ].join("\n")
          }

          it 'overrides' do
            expect(rendered).to start_with(rendered_actionwords)
          end
        end

        context 'actionwords' do
          let(:meta) { "php_actionwords_file_header:declare(strict_types=1);\n/** Test License */" }

          let(:rendered_actionwords) {
            [
              '<?php',
              '',
              'namespace Tests;',
              '',
              'use Behat\Gherkin\Node\TableNode;',
              'use Codeception\Actor;',
              'use PHPUnit\Framework\IncompleteTestError;',
              '',
              'class BddTester extends Actor',
            ].join("\n")
          }

          it 'overrides' do
            expect(rendered).to start_with(rendered_actionwords)
          end
        end

        context 'step_definitions' do
          let(:meta) { "php_step_definitions_file_header:declare(strict_types=1);\n/** Test License */" }

          let(:rendered_actionwords) {
            [
              '<?php',
              'declare(strict_types=1);',
              '/** Test License */',
              '',
              'namespace Tests;',
              '',
              'use Behat\Gherkin\Node\TableNode;',
              'use Codeception\Actor;',
              'use PHPUnit\Framework\IncompleteTestError;',
              '',
              'class BddTester extends Actor',
            ].join("\n")
          }

          it 'overrides' do
            expect(rendered).to start_with(rendered_actionwords)
          end

          context 'overrides meta.php_file_header' do
            let(:meta) { [
              'php_file_header:ignored_value',
              "php_step_definitions_file_header:declare(strict_types=1);\n/** Test License */"
            ].join(',') }

            it do
              expect(rendered).to start_with(rendered_actionwords)
            end
          end
        end
      end
    end

    context 'Action words' do
      let(:meta) {""}
      let(:options) {
        context_for(
          only: "actionwords",
          language: language,
          framework: framework,
          meta: meta,
        )
      }

      let(:node_to_render) {
        project.children[:actionwords].children[:actionwords].prepend(
          make_actionword(
            "an action word \"actionWord\" with action word steps",
            parameters: [
              make_parameter("actionWord", default: literal(42))
            ],
            body: [
              make_call("I login on", arguments:[make_argument("site", variable("actionWord")), make_argument("username", literal("user"))], annotation: "given"),
              make_call("I have some \"number\"", arguments:[make_argument("number", Hiptest::Nodes::NumericLiteral.new("50"))], annotation: "given")
            ]
          ),
          make_actionword(
            "an action word with \"number\" of \"regular\" steps",
            parameters: [
              make_parameter("number", default: literal(3)),
              make_parameter("regular", default: literal('regular'))
            ],
            body: [
              make_call("I login on", arguments:[make_argument("site", literal("site")), make_argument("username", literal("user"))], annotation: "given"),
              Hiptest::Nodes::Step.new('result', 'check something'),
              Hiptest::Nodes::Step.new('result', Hiptest::Nodes::Template.new([
                Hiptest::Nodes::StringLiteral.new('Check something with '),
                Hiptest::Nodes::Variable.new('argument1'),
                Hiptest::Nodes::StringLiteral.new(' '),
                Hiptest::Nodes::Variable.new('argument2'),
              ])),
              Hiptest::Nodes::Step.new('action', 'do something'),
              Hiptest::Nodes::Step.new('action', Hiptest::Nodes::Template.new([
                Hiptest::Nodes::StringLiteral.new('Do something with '),
                Hiptest::Nodes::Variable.new('argument1'),
                Hiptest::Nodes::StringLiteral.new(' '),
                Hiptest::Nodes::Variable.new('argument2'),
              ])),
            ]
          )
        )
        project.children[:scenarios].children[:scenarios].append(
          make_scenario("High level scenario", body: [
            make_call("an action word \"actionWord\" with action word steps", arguments:[make_argument("actionWord", literal(""))], annotation: "given")
          ])
        )
        Hiptest::NodeModifiers.add_all(project)

        project.children[:actionwords]
      }

      let(:rendered_actionwords) {
        [
          '<?php',
          '',
          'namespace Tests\Step\Bdd;',
          '',
          'use Behat\Gherkin\Node\TableNode;',
          'use PHPUnit\Framework\IncompleteTestError;',
          'use Tests\BddTester;',
          '',
          'class ActionWords',
          '{',
          '  protected BddTester $I;',
          '',
          '  public function __construct(BddTester $I)',
          '  {',
          '    $this->I = $I;',
          '  }',
          '',
          '  /**',
          '   * @Given an action word :actionWord with action word steps',
          '   */',
          '  public function anActionWordActionWordWithActionWordSteps($actionWord)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->anActionWordActionWordWithActionWordSteps($actionWord);',
          '      return;',
          '    }',
          '',
          '    // Given I login on "<actionWord>" "user"',
          '    $this->iLoginOn($actionWord, \'user\');',
          '    // Given I have some "50"',
          '    $this->iHaveSomeNumber(50);',
          '  }',
          '',
          '  public function anActionWordWithNumberOfRegularSteps($number, $regular)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->anActionWordWithNumberOfRegularSteps($number, $regular);',
          '      return;',
          '    }',
          '',
          '    // Given I login on "site" "user"',
          '    $this->iLoginOn(\'site\', \'user\');',
          '',
          '    if (!method_exists($this->I, \'checkSomethingResult\')) {',
          '      throw new IncompleteTestError(\'Action `checkSomethingResult` is not defined. Implement `public function checkSomethingResult()` in `BddTester`.\');',
          '    }',
          '',
          '    $this->I->checkSomethingResult();',
          '',
          '    if (!method_exists($this->I, \'checkSomethingWithArgument1Argument2Result\')) {',
          '      throw new IncompleteTestError(\'Action `checkSomethingWithArgument1Argument2Result` is not defined. Implement `public function checkSomethingWithArgument1Argument2Result($argument1, $argument2)` in `BddTester`.\');',
          '    }',
          '',
          '    $this->I->checkSomethingWithArgument1Argument2Result($argument1, $argument2);',
          '',
          '    if (!method_exists($this->I, \'doSomethingAction\')) {',
          '      throw new IncompleteTestError(\'Action `doSomethingAction` is not defined. Implement `public function doSomethingAction()` in `BddTester`.\');',
          '    }',
          '',
          '    $this->I->doSomethingAction();',
          '',
          '    if (!method_exists($this->I, \'doSomethingWithArgument1Argument2Action\')) {',
          '      throw new IncompleteTestError(\'Action `doSomethingWithArgument1Argument2Action` is not defined. Implement `public function doSomethingWithArgument1Argument2Action($argument1, $argument2)` in `BddTester`.\');',
          '    }',
          '',
          '    $this->I->doSomethingWithArgument1Argument2Action($argument1, $argument2);',
          '  }',
          '',
          '  /**',
          '   * @Given the color :color',
          '   */',
          '  public function theColorColor($color)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->theColorColor($color);',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `theColorColor` is not defined. Implement `public function theColorColor($color)` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @When you mix colors',
          '   */',
          '  public function youMixColors()',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->youMixColors();',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `youMixColors` is not defined. Implement `public function youMixColors()` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @Then you obtain :color',
          '   */',
          '  public function youObtainColor($color)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->youObtainColor($color);',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `youObtainColor` is not defined. Implement `public function youObtainColor($color)` in `BddTester`.\');',
          '  }',
          '',
          '  public function unusedActionWord()',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->unusedActionWord();',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `unusedActionWord` is not defined. Implement `public function unusedActionWord()` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @Then you cannot play croquet',
          '   */',
          '  public function youCannotPlayCroquet()',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->youCannotPlayCroquet();',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `youCannotPlayCroquet` is not defined. Implement `public function youCannotPlayCroquet()` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @Given I am on the :site home page',
          '   */',
          '  public function iAmOnTheSiteHomePage($site, $freeText)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->iAmOnTheSiteHomePage($site, $freeText);',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `iAmOnTheSiteHomePage` is not defined. Implement `public function iAmOnTheSiteHomePage($site, $freeText)` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @When the following users are available on :site',
          '   */',
          '  public function theFollowingUsersAreAvailableOnSite($site, TableNode $datatable)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->theFollowingUsersAreAvailableOnSite($site, $datatable);',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `theFollowingUsersAreAvailableOnSite` is not defined. Implement `public function theFollowingUsersAreAvailableOnSite($site, $datatable)` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @Given an untrimed action word',
          '   */',
          '  public function anUntrimedActionWord()',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->anUntrimedActionWord();',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `anUntrimedActionWord` is not defined. Implement `public function anUntrimedActionWord()` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @Given the :order of :parameters is weird :p0 :p1',
          '   */',
          '  public function theOrderOfParametersIsWeird($order, $parameters, $p0, $p1)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->theOrderOfParametersIsWeird($order, $parameters, $p0, $p1);',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `theOrderOfParametersIsWeird` is not defined. Implement `public function theOrderOfParametersIsWeird($order, $parameters, $p0, $p1)` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @Given I login on :site :username',
          '   */',
          '  public function iLoginOn($site, $username)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->iLoginOn($site, $username);',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `iLoginOn` is not defined. Implement `public function iLoginOn($site, $username)` in `BddTester`.\');',
          '  }',
          '',
          '  /**',
          '   * @Given I have some :number',
          '   */',
          '  public function iHaveSomeNumber($number)',
          '  {',
          '    if (method_exists($this->I, __FUNCTION__)) {',
          '      $this->I->iHaveSomeNumber($number);',
          '      return;',
          '    }',
          '',
          '    throw new IncompleteTestError(\'Action `iHaveSomeNumber` is not defined. Implement `public function iHaveSomeNumber($number)` in `BddTester`.\');',
          '  }',
          '}'
        ].join("\n")
      }

      it 'generates actionwords definitions' do
        expect(rendered).to eq(rendered_actionwords)
      end

      context 'meta can be used to configure codeception template' do
        let(:meta) {
          [
            'codeception_suite_name:Acceptance',
            'codeception_actor_suffix:Actor',
            'codeception_support_namespace:Tests\\_support',
          ].join(',')
        }

        let(:rendered_actionwords) {
          [
            '<?php',
            '',
            'namespace Tests\_support\Step\Acceptance;',
            '',
            'use Behat\Gherkin\Node\TableNode;',
            'use PHPUnit\Framework\IncompleteTestError;',
            'use Tests\_support\AcceptanceActor;',
            '',
            'class ActionWords',
            '{',
            '  protected AcceptanceActor $I;',
            '',
            '  public function __construct(AcceptanceActor $I)',
            '  {',
            '    $this->I = $I;',
            '  }',
            '',
            '  /**',
            '   * @Given an action word :actionWord with action word steps',
            '   */',
            '  public function anActionWordActionWordWithActionWordSteps($actionWord)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->anActionWordActionWordWithActionWordSteps($actionWord);',
            '      return;',
            '    }',
            '',
            '    // Given I login on "<actionWord>" "user"',
            '    $this->iLoginOn($actionWord, \'user\');',
            '    // Given I have some "50"',
            '    $this->iHaveSomeNumber(50);',
            '  }',
            '',
            '  public function anActionWordWithNumberOfRegularSteps($number, $regular)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->anActionWordWithNumberOfRegularSteps($number, $regular);',
            '      return;',
            '    }',
            '',
            '    // Given I login on "site" "user"',
            '    $this->iLoginOn(\'site\', \'user\');',
            '',
            '    if (!method_exists($this->I, \'checkSomethingResult\')) {',
            '      throw new IncompleteTestError(\'Action `checkSomethingResult` is not defined. Implement `public function checkSomethingResult()` in `AcceptanceActor`.\');',
            '    }',
            '',
            '    $this->I->checkSomethingResult();',
            '',
            '    if (!method_exists($this->I, \'checkSomethingWithArgument1Argument2Result\')) {',
            '      throw new IncompleteTestError(\'Action `checkSomethingWithArgument1Argument2Result` is not defined. Implement `public function checkSomethingWithArgument1Argument2Result($argument1, $argument2)` in `AcceptanceActor`.\');',
            '    }',
            '',
            '    $this->I->checkSomethingWithArgument1Argument2Result($argument1, $argument2);',
            '',
            '    if (!method_exists($this->I, \'doSomethingAction\')) {',
            '      throw new IncompleteTestError(\'Action `doSomethingAction` is not defined. Implement `public function doSomethingAction()` in `AcceptanceActor`.\');',
            '    }',
            '',
            '    $this->I->doSomethingAction();',
            '',
            '    if (!method_exists($this->I, \'doSomethingWithArgument1Argument2Action\')) {',
            '      throw new IncompleteTestError(\'Action `doSomethingWithArgument1Argument2Action` is not defined. Implement `public function doSomethingWithArgument1Argument2Action($argument1, $argument2)` in `AcceptanceActor`.\');',
            '    }',
            '',
            '    $this->I->doSomethingWithArgument1Argument2Action($argument1, $argument2);',
            '  }',
            '',
            '  /**',
            '   * @Given the color :color',
            '   */',
            '  public function theColorColor($color)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->theColorColor($color);',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `theColorColor` is not defined. Implement `public function theColorColor($color)` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @When you mix colors',
            '   */',
            '  public function youMixColors()',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->youMixColors();',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `youMixColors` is not defined. Implement `public function youMixColors()` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @Then you obtain :color',
            '   */',
            '  public function youObtainColor($color)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->youObtainColor($color);',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `youObtainColor` is not defined. Implement `public function youObtainColor($color)` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  public function unusedActionWord()',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->unusedActionWord();',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `unusedActionWord` is not defined. Implement `public function unusedActionWord()` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @Then you cannot play croquet',
            '   */',
            '  public function youCannotPlayCroquet()',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->youCannotPlayCroquet();',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `youCannotPlayCroquet` is not defined. Implement `public function youCannotPlayCroquet()` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @Given I am on the :site home page',
            '   */',
            '  public function iAmOnTheSiteHomePage($site, $freeText)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->iAmOnTheSiteHomePage($site, $freeText);',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `iAmOnTheSiteHomePage` is not defined. Implement `public function iAmOnTheSiteHomePage($site, $freeText)` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @When the following users are available on :site',
            '   */',
            '  public function theFollowingUsersAreAvailableOnSite($site, TableNode $datatable)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->theFollowingUsersAreAvailableOnSite($site, $datatable);',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `theFollowingUsersAreAvailableOnSite` is not defined. Implement `public function theFollowingUsersAreAvailableOnSite($site, $datatable)` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @Given an untrimed action word',
            '   */',
            '  public function anUntrimedActionWord()',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->anUntrimedActionWord();',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `anUntrimedActionWord` is not defined. Implement `public function anUntrimedActionWord()` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @Given the :order of :parameters is weird :p0 :p1',
            '   */',
            '  public function theOrderOfParametersIsWeird($order, $parameters, $p0, $p1)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->theOrderOfParametersIsWeird($order, $parameters, $p0, $p1);',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `theOrderOfParametersIsWeird` is not defined. Implement `public function theOrderOfParametersIsWeird($order, $parameters, $p0, $p1)` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @Given I login on :site :username',
            '   */',
            '  public function iLoginOn($site, $username)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->iLoginOn($site, $username);',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `iLoginOn` is not defined. Implement `public function iLoginOn($site, $username)` in `AcceptanceActor`.\');',
            '  }',
            '',
            '  /**',
            '   * @Given I have some :number',
            '   */',
            '  public function iHaveSomeNumber($number)',
            '  {',
            '    if (method_exists($this->I, __FUNCTION__)) {',
            '      $this->I->iHaveSomeNumber($number);',
            '      return;',
            '    }',
            '',
            '    throw new IncompleteTestError(\'Action `iHaveSomeNumber` is not defined. Implement `public function iHaveSomeNumber($number)` in `AcceptanceActor`.\');',
            '  }',
            '}'
          ].join("\n")
        }

        it 'overrides' do
          expect(rendered).to eq(rendered_actionwords)
        end
      end

      context 'meta can be used to configure php template' do
        context 'all' do
          let(:meta) { "php_file_header:declare(strict_types=1);\n/** Test License */" }

          let(:rendered_actionwords) {
            [
              '<?php',
              'declare(strict_types=1);',
              '/** Test License */',
              '',
              'namespace Tests\Step\Bdd;',
              '',
              'use Behat\Gherkin\Node\TableNode;',
              'use PHPUnit\Framework\IncompleteTestError;',
              'use Tests\BddTester;',
              '',
              'class ActionWords',
            ].join("\n")
          }

          it 'overrides' do
            expect(rendered).to start_with(rendered_actionwords)
          end
        end

        context 'actionwords' do
          let(:meta) { "php_actionwords_file_header:declare(strict_types=1);\n/** Test License */" }

          let(:rendered_actionwords) {
            [
              '<?php',
              'declare(strict_types=1);',
              '/** Test License */',
              '',
              'namespace Tests\Step\Bdd;',
              '',
              'use Behat\Gherkin\Node\TableNode;',
              'use PHPUnit\Framework\IncompleteTestError;',
              'use Tests\BddTester;',
              '',
              'class ActionWords',
            ].join("\n")
          }

          it 'overrides' do
            expect(rendered).to start_with(rendered_actionwords)
          end

          context 'overrides meta.php_file_header' do
            let(:meta) { [
              'php_file_header:ignored_value',
              "php_actionwords_file_header:declare(strict_types=1);\n/** Test License */"
            ].join(',') }

            it do
              expect(rendered).to start_with(rendered_actionwords)
            end
          end
        end

        context 'step_definitions' do
          let(:meta) { "php_step_definitions_file_header:declare(strict_types=1);\n/** Test License */" }

          let(:rendered_actionwords) {
            [
              '<?php',
              '',
              'namespace Tests\Step\Bdd;',
              '',
              'use Behat\Gherkin\Node\TableNode;',
              'use PHPUnit\Framework\IncompleteTestError;',
              'use Tests\BddTester;',
              '',
              'class ActionWords',
            ].join("\n")
          }

          it 'overrides' do
            expect(rendered).to start_with(rendered_actionwords)
          end
        end
      end
    end
  end
end
