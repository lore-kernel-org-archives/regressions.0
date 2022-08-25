Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0B29A9
	for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 10:43:43 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id a133so14930867oif.4
        for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=zrIRGklNoO2a5CD9cGT6cGI8Xi9o//UAgqinYGld0u0=;
        b=sQXkC4Y6tu3f7sZSxSUrG3VeU9KAZZEQED4NsZGoqcDMb0WNORpyF+E/iBBHEmsoQB
         xaUOwG0teJvwgQGIVxC2MCKY3XCNvreq3rzEIidHmHgN0diW3nPGiG4dsK4qmlvJKorm
         AwuxpBrrK+ZSi3mkJxnlGYbvFvBbnnZxsHNcYCCYmChDRISJYUaRuI031uZilmkMmHRx
         SgilGYKlkjKa7jSRsAqnxxTpUrVkDiqJMowEKp2izcKK8j5CEUt4eluqcV2JCKZDonHI
         WodWylzgHS3vgt51nLZt2C3ztyR861IMjyPwCckx9X8DtX28n6IBqapxfdwLyfqWOaoM
         D/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=zrIRGklNoO2a5CD9cGT6cGI8Xi9o//UAgqinYGld0u0=;
        b=O7iBbnHYR+qCpJKFlSLOfLnpMz47bR5IH4cmAvTyKrskWNpbFwDN7laYb7owUtOfXl
         Yke64RtRpfkaGVn+K/aH6vhXLRdnSD/UcWMZZTIZE+WA9vrqtEsOzc16vrPPW8YTDfrI
         pgSB8tC0QpOO7zduQl6tplGTLRoBaGs6WkDh6WRwEKfhkCIapvwfWXreSsYO+qSRRHjJ
         TQ9XZtGpLGrgYKP034YYlo4UddvUuexzlYNJKH6dNgJpuH1xpAhCJloXkd9XUmDsMAjV
         8mDgkjDWGWdUWfQYuuKNB/AuB9e5GuSy1qJ6d5JRrIXBBTqnq63ymRZkzlxBkP+EeAo/
         6vPQ==
X-Gm-Message-State: ACgBeo3cjL0QiPnE4nt5VrEK40NDhtwWKhV44wdjd+De2b/jqL5iFgRi
	OwJt4vak2hZ4ybQBiE0wsT+nawt5hAXkOVaNJgPMVQ==
X-Google-Smtp-Source: AA6agR4l2jLyUhp4ZTjfG4oWL/P06sEpXpvwrFCJNJhC3/NFHdjStcjUwCLe2srqGsAAQCCGJ4TLcWgBznQ+hKT3H7I=
X-Received: by 2002:a05:6808:1242:b0:345:7e6b:961b with SMTP id
 o2-20020a056808124200b003457e6b961bmr1435273oiv.290.1661424222144; Thu, 25
 Aug 2022 03:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 25 Aug 2022 16:13:30 +0530
Message-ID: <CA+G9fYsHVdu0toduQqk6vsR8Z8mOVzZ9-_p3O5fjQ5mOpSxsDA@mail.gmail.com>
Subject: [next] x86: fs/hugetlbfs/inode.c:673:16: error: variable 'm_index' is
 uninitialized when used here [-Werror,-Wuninitialized]
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Cc: Muchun Song <songmuchun@bytedance.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	David Hildenbrand <david@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	James Houghton <jthoughton@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@suse.com>, Mina Almasry <almasrymina@google.com>, 
	Naoya Horiguchi <naoya.horiguchi@linux.dev>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Peter Xu <peterx@redhat.com>, Prakash Sangappa <prakash.sangappa@oracle.com>
Content-Type: text/plain; charset="UTF-8"

The x86_64 and i386 clang builds failed due to these warnings / errors
on Linux next-20220825.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

fs/hugetlbfs/inode.c:673:16: error: variable 'm_index' is
uninitialized when used here [-Werror,-Wuninitialized]
                                                m_start, m_index, truncate_op);
                                                         ^~~~~~~
fs/hugetlbfs/inode.c:651:26: note: initialize the variable 'm_index'
to silence this warning
        pgoff_t m_start, m_index;
                                ^
                                 = 0
1 error generated.
make[3]: *** [scripts/Makefile.build:250: fs/hugetlbfs/inode.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:525: fs/hugetlbfs] Error 2

Build link: https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/

Steps to reproduce:
-------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch x86_64 --toolchain clang-14
--kconfig https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/config
LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
