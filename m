Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCE63208
	for <regressions@lists.linux.dev>; Thu, 17 Nov 2022 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668695663; x=1700231663;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=FUaqxpNOUtBFK9yqPq0EtJNjrRCYpDB/RJdLe9Np1/M=;
  b=LGwoec3kZe6GQt0mPzQzzV2BuR2jUsD8A5+wOEV44WDdLvCBwbJAsqmi
   NDW6PeWCR40r64vlwtexh5cvwo1lJyG4RdzWVjEH5S9IMGhDlnYia9qO9
   X+mkQk2JTsJzChUvbW3fCrQQZkr7YbqK0pTWxOfVBCJEHW3GtfJJgy4gy
   AsJo4ZFKh5rCsOUS+dNa+mMVlWCab/aWiHnB6H0jC1IxPstHoJ+F3+YrU
   RLnX+PvlWysd5ZFakDYt76+13nieqMXA8fcrlX2eiNnkOoFMgwTJV4ms1
   O3/w374pQO7lEoujvdT60xfagOxBrSMRyeWHyQ9TC703hieLr9I8jhici
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311568588"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="311568588"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 06:34:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="814534057"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="814534057"
Received: from vrgatne-mobl4.amr.corp.intel.com (HELO [10.209.115.197]) ([10.209.115.197])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 06:34:15 -0800
Content-Type: multipart/mixed; boundary="------------5Ob6KInVGuG0YbX9A7MUQQSR"
Message-ID: <4208866d-338f-4781-7ff9-023f016c5b07@intel.com>
Date: Thu, 17 Nov 2022 06:34:15 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: WARNING: CPU: 0 PID: 0 at arch/x86/include/asm/kfence.h:46
 kfence_protect
Content-Language: en-US
To: Marco Elver <elver@google.com>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Peter Zijlstra <peterz@infradead.org>
Cc: kasan-dev <kasan-dev@googlegroups.com>, X86 ML <x86@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Potapenko <glider@google.com>
References: <CA+G9fYuFxZTxkeS35VTZMXwQvohu73W3xbZ5NtjebsVvH6hCuA@mail.gmail.com>
 <Y3Y+DQsWa79bNuKj@elver.google.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <Y3Y+DQsWa79bNuKj@elver.google.com>

This is a multi-part message in MIME format.
--------------5Ob6KInVGuG0YbX9A7MUQQSR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/22 05:58, Marco Elver wrote:
> [    0.663761] WARNING: CPU: 0 PID: 0 at arch/x86/include/asm/kfence.h:46 kfence_protect+0x7b/0x120
> [    0.664033] WARNING: CPU: 0 PID: 0 at mm/kfence/core.c:234 kfence_protect+0x7d/0x120
> [    0.664465] kfence: kfence_init failed

Any chance you could add some debugging and figure out what actually
made kfence call over?  Was it the pte or the level?

        if (WARN_ON(!pte || level != PG_LEVEL_4K))
                return false;

I can see how the thing you bisected to might lead to a page table not
being split, which could mess with the 'level' check.

Also, is there a reason this code is mucking with the page tables
directly?  It seems, uh, rather wonky.  This, for instance:

>         if (protect)
>                 set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
>         else
>                 set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
> 
>         /*
>          * Flush this CPU's TLB, assuming whoever did the allocation/free is
>          * likely to continue running on this CPU.
>          */
>         preempt_disable();
>         flush_tlb_one_kernel(addr);
>         preempt_enable();

Seems rather broken.  I assume the preempt_disable() is there to get rid
of some warnings.  But, there is nothing I can see to *keep* the CPU
that did the free from being different from the one where the TLB flush
is performed until the preempt_disable().  That makes the
flush_tlb_one_kernel() mostly useless.

Is there a reason this code isn't using the existing page table
manipulation functions and tries to code its own?  What prevents it from
using something like the attached patch?
--------------5Ob6KInVGuG0YbX9A7MUQQSR
Content-Type: text/x-patch; charset=UTF-8; name="kfence.patch"
Content-Disposition: attachment; filename="kfence.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2tmZW5jZS5oIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20va2ZlbmNlLmgKaW5kZXggZmY1YzcxMzRhMzdhLi41Y2RiM2ExZjM5OTUg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2tmZW5jZS5oCisrKyBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2tmZW5jZS5oCkBAIC0zNywzNCArMzcsMTMgQEAgc3RhdGljIGlu
bGluZSBib29sIGFyY2hfa2ZlbmNlX2luaXRfcG9vbCh2b2lkKQogCXJldHVybiB0cnVlOwog
fQogCi0vKiBQcm90ZWN0IHRoZSBnaXZlbiBwYWdlIGFuZCBmbHVzaCBUTEIuICovCiBzdGF0
aWMgaW5saW5lIGJvb2wga2ZlbmNlX3Byb3RlY3RfcGFnZSh1bnNpZ25lZCBsb25nIGFkZHIs
IGJvb2wgcHJvdGVjdCkKIHsKLQl1bnNpZ25lZCBpbnQgbGV2ZWw7Ci0JcHRlX3QgKnB0ZSA9
IGxvb2t1cF9hZGRyZXNzKGFkZHIsICZsZXZlbCk7Ci0KLQlpZiAoV0FSTl9PTighcHRlIHx8
IGxldmVsICE9IFBHX0xFVkVMXzRLKSkKLQkJcmV0dXJuIGZhbHNlOwotCi0JLyoKLQkgKiBX
ZSBuZWVkIHRvIGF2b2lkIElQSXMsIGFzIHdlIG1heSBnZXQgS0ZFTkNFIGFsbG9jYXRpb25z
IG9yIGZhdWx0cwotCSAqIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZC4gVGhlcmVmb3JlLCB0
aGUgYmVsb3cgaXMgYmVzdC1lZmZvcnQsIGFuZAotCSAqIGRvZXMgbm90IGZsdXNoIFRMQnMg
b24gYWxsIENQVXMuIFdlIGNhbiB0b2xlcmF0ZSBzb21lIGluYWNjdXJhY3k7Ci0JICogbGF6
eSBmYXVsdCBoYW5kbGluZyB0YWtlcyBjYXJlIG9mIGZhdWx0cyBhZnRlciB0aGUgcGFnZSBp
cyBQUkVTRU5ULgotCSAqLwotCiAJaWYgKHByb3RlY3QpCi0JCXNldF9wdGUocHRlLCBfX3B0
ZShwdGVfdmFsKCpwdGUpICYgfl9QQUdFX1BSRVNFTlQpKTsKKwkJc2V0X21lbW9yeV9ucChh
ZGRyLCBhZGRyICsgUEFHRV9TSVpFKTsKIAllbHNlCi0JCXNldF9wdGUocHRlLCBfX3B0ZShw
dGVfdmFsKCpwdGUpIHwgX1BBR0VfUFJFU0VOVCkpOworCQlzZXRfbWVtb3J5X3AoYWRkciwg
YWRkciArIFBBR0VfU0laRSk7CiAKLQkvKgotCSAqIEZsdXNoIHRoaXMgQ1BVJ3MgVExCLCBh
c3N1bWluZyB3aG9ldmVyIGRpZCB0aGUgYWxsb2NhdGlvbi9mcmVlIGlzCi0JICogbGlrZWx5
IHRvIGNvbnRpbnVlIHJ1bm5pbmcgb24gdGhpcyBDUFUuCi0JICovCi0JcHJlZW1wdF9kaXNh
YmxlKCk7Ci0JZmx1c2hfdGxiX29uZV9rZXJuZWwoYWRkcik7Ci0JcHJlZW1wdF9lbmFibGUo
KTsKIAlyZXR1cm4gdHJ1ZTsKIH0KIAo=

--------------5Ob6KInVGuG0YbX9A7MUQQSR--
