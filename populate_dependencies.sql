INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732266163-fix-boost-test-exec-monitor-config';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732269265-implement-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732269646-fix-cicd-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732278483-redis-cache-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732290815-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732291083-sum-sq-performance';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732291218-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732316912-fix-modulo-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732316942-fix-modulo-ordering-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732320678-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732320850-sum-sq-performance';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732320872-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732320896-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732320918-modulo-ordering-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732320941-enable-modintless-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732320964-enable-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732322133-fix-fraction-comparison-nan';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732322216-improve-sum-sq';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732322231-add-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732322244-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732322353-modulo-ordering-integer-changes';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732343450-fix-sh-test-async-tasks';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732362113-add-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732362113-enable-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732362113-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732362113-improve-sum-sq';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732368543-add-redis-availability-check';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732368543-add-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732368543-implement-resetalldb-leveldb';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732368543-improve-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732368543-move-resetalldb-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732368543-reorder-leveldb-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732369266-add-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732369452-improve-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732412484-windows-build-system';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732421348-modulo-product-optimization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732422786-modulo-product-optimization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1732532355-enable-exponentiation-same-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1733564464-shor-algorithm';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1733598947-shor-algorithm';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1734222552-is-mod-simplifiable';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1735357413-refactor-sumordercomparator';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1735376693-refactor-sumordercomparator-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1735385000-fix-sumordercomparator-no-base-changes';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1735447802-refactor-sumordercomparator-clean2';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1735898099-logarithm-deserialization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1736158748-fix-boost-test-linking';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1736803074-fix-pi-comparison';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1736963251-factorial-parsing';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1736963251-factorial-parsing-minimal';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1737046068-fix-radical-solving-2';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1737219240-radical-fix';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1737572698-refactor-sumordercomparator-clean3';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1737587292-document-nan-comparison-behavior';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1739114494-fix-expression-normalization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1739114722-enable-cube-root-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1739307546-fix-quadratic-system-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732240150-add-redis-cache' 
            AND b2.name = 'devin/1739307546-fix-quadratic-system-test-enable';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732240150-add-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732269265-implement-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732269646-fix-cicd-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732278483-redis-cache-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732290815-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732291083-sum-sq-performance';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732291218-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732316912-fix-modulo-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732316942-fix-modulo-ordering-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732320678-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732320850-sum-sq-performance';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732320872-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732320896-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732320918-modulo-ordering-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732320941-enable-modintless-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732320964-enable-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732322133-fix-fraction-comparison-nan';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732322216-improve-sum-sq';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732322231-add-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732322244-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732322353-modulo-ordering-integer-changes';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732343450-fix-sh-test-async-tasks';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732362113-add-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732362113-enable-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732362113-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732362113-improve-sum-sq';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732368543-add-redis-availability-check';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732368543-add-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732368543-implement-resetalldb-leveldb';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732368543-improve-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732368543-move-resetalldb-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732368543-reorder-leveldb-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732369266-add-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732369452-improve-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732412484-windows-build-system';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732421348-modulo-product-optimization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732422786-modulo-product-optimization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1732532355-enable-exponentiation-same-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1733564464-shor-algorithm';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1733598947-shor-algorithm';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1734222552-is-mod-simplifiable';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1735357413-refactor-sumordercomparator';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1735376693-refactor-sumordercomparator-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1735385000-fix-sumordercomparator-no-base-changes';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1735447802-refactor-sumordercomparator-clean2';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1735898099-logarithm-deserialization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1736158748-fix-boost-test-linking';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1736803074-fix-pi-comparison';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1736963251-factorial-parsing';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1736963251-factorial-parsing-minimal';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1737046068-fix-radical-solving-2';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1737219240-radical-fix';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1737572698-refactor-sumordercomparator-clean3';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1737587292-document-nan-comparison-behavior';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1739114494-fix-expression-normalization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1739114722-enable-cube-root-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1739307546-fix-quadratic-system-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732266163-fix-boost-test-exec-monitor-config' 
            AND b2.name = 'devin/1739307546-fix-quadratic-system-test-enable';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269265-implement-redis-cache' 
            AND b2.name = 'devin/1732240150-add-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269265-implement-redis-cache' 
            AND b2.name = 'devin/1732266163-fix-boost-test-exec-monitor-config';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269265-implement-redis-cache' 
            AND b2.name = 'devin/1732269646-fix-cicd-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732240150-add-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732266163-fix-boost-test-exec-monitor-config';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732269265-implement-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732278483-redis-cache-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732290815-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732291218-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732316912-fix-modulo-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732316942-fix-modulo-ordering-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732320678-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732320872-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732320896-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732320918-modulo-ordering-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732320941-enable-modintless-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732320964-enable-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732322133-fix-fraction-comparison-nan';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732322231-add-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732322244-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732322353-modulo-ordering-integer-changes';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732343450-fix-sh-test-async-tasks';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732412484-windows-build-system';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732422786-modulo-product-optimization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1732532355-enable-exponentiation-same-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1733564464-shor-algorithm';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1733598947-shor-algorithm';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1734222552-is-mod-simplifiable';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1735357413-refactor-sumordercomparator';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1735376693-refactor-sumordercomparator-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1735385000-fix-sumordercomparator-no-base-changes';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1735447802-refactor-sumordercomparator-clean2';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1735898099-logarithm-deserialization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1736158748-fix-boost-test-linking';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1736803074-fix-pi-comparison';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1736963251-factorial-parsing';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1736963251-factorial-parsing-minimal';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1737046068-fix-radical-solving-2';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1737219240-radical-fix';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1737572698-refactor-sumordercomparator-clean3';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1739114722-enable-cube-root-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732269646-fix-cicd-redis-cache' 
            AND b2.name = 'devin/1739307546-fix-quadratic-system-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732240150-add-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732266163-fix-boost-test-exec-monitor-config';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732269646-fix-cicd-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732290815-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732291083-sum-sq-performance';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732291218-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732316912-fix-modulo-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732316942-fix-modulo-ordering-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732320678-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732320850-sum-sq-performance';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732320872-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732320896-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732320918-modulo-ordering-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732320941-enable-modintless-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732320964-enable-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732322133-fix-fraction-comparison-nan';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732322216-improve-sum-sq';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732322231-add-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732322244-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732322353-modulo-ordering-integer-changes';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732343450-fix-sh-test-async-tasks';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732362113-add-exponentiation-order-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732362113-enable-fraction-ordering-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732362113-fix-integer-ordering';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732362113-improve-sum-sq';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732368543-add-redis-availability-check';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732368543-add-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732368543-implement-resetalldb-leveldb';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732368543-improve-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732368543-move-resetalldb-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732368543-reorder-leveldb-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732369266-add-redis-cache-implementation';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732369289-fix-add-redis-availability-check-in-tests';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732369452-improve-redis-cache';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732412484-windows-build-system';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732421348-modulo-product-optimization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732422786-modulo-product-optimization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1732532355-enable-exponentiation-same-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1733564464-shor-algorithm';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1733598947-shor-algorithm';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1734222552-is-mod-simplifiable';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1735357413-refactor-sumordercomparator';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1735376693-refactor-sumordercomparator-clean';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1735385000-fix-sumordercomparator-no-base-changes';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1735447802-refactor-sumordercomparator-clean2';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1735898099-logarithm-deserialization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1736158748-fix-boost-test-linking';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1736803074-fix-pi-comparison';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1736963251-factorial-parsing';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1736963251-factorial-parsing-minimal';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1737046068-fix-radical-solving-2';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1737219240-radical-fix';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1737572698-refactor-sumordercomparator-clean3';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1737587292-document-nan-comparison-behavior';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1739114494-fix-expression-normalization';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1739114722-enable-cube-root-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1739307546-fix-quadratic-system-test';
INSERT INTO branch_dependencies (dependent_branch_id, dependency_branch_id, dependency_type) 
            SELECT b1.id, b2.id, 'related'
            FROM branches b1, branches b2 
            WHERE b1.name = 'devin/1732278483-redis-cache-clean' 
            AND b2.name = 'devin/1739307546-fix-quadratic-system-test-enable';
