Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06BCA464
	for <regressions@lists.linux.dev>; Thu, 17 Nov 2022 23:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668729289; x=1700265289;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=ifNgXix6UY+4zxJYIfL1i9Cvl28acOJnPFX6Dwbdguc=;
  b=hmMZ9mfq0uqNCCjObrTeZ8XidxHsAMKBLOXDceqge714YBpgD3g5GiKV
   ivez6gzScUL2+INnSiDfiHSpLs0jKksFrf8OZ31B5J21zxHwH6C3qlEhS
   UuCtvlsekdCqd79Hjd9g/VcoLtHRplYdZuDQMtdwFHjAjFKs5TIB5Nv/r
   NtLCYp6a2GYUnFzt/hu4ipKjqSGt9ylAQIp77cmDdZ6OQIwsr/UmcQvnC
   VeqZOsMsge51fMGcj/zqIxzEjIpjLSM3X1fdfbU9rXuFuZ26qKdIIk3Z9
   aP/pLSV56c9fqJWSWJMSFiMLrVMna9Y3UWDw0LaQAPwjUpphA24wm1eeK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="314825073"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="314825073"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 15:54:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="703530903"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="703530903"
Received: from vrgatne-mobl4.amr.corp.intel.com (HELO [10.209.115.197]) ([10.209.115.197])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 15:54:22 -0800
Content-Type: multipart/mixed; boundary="------------Lh9aXApYj7BdK6v1bd25dwlY"
Message-ID: <41ac24c4-6c95-d946-2679-c1be2cb20536@intel.com>
Date: Thu, 17 Nov 2022 15:54:21 -0800
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
To: Marco Elver <elver@google.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kasan-dev
 <kasan-dev@googlegroups.com>, X86 ML <x86@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Potapenko <glider@google.com>
References: <CA+G9fYuFxZTxkeS35VTZMXwQvohu73W3xbZ5NtjebsVvH6hCuA@mail.gmail.com>
 <Y3Y+DQsWa79bNuKj@elver.google.com>
 <4208866d-338f-4781-7ff9-023f016c5b07@intel.com>
 <Y3bCV6VckVUEF7Pq@elver.google.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <Y3bCV6VckVUEF7Pq@elver.google.com>

This is a multi-part message in MIME format.
--------------Lh9aXApYj7BdK6v1bd25dwlY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/22 15:23, Marco Elver wrote:
> Yes - it's the 'level != PG_LEVEL_4K'.

That plus the bisect made it pretty easy to find, thanks for the effort!

Could you double-check that the attached patch fixes it?  It seemed to
for me.

The issue was that the new "No changes, easy!" check in the suspect
commit didn't check the cpa->force_split option.  It didn't split down
to 4k and then all hell broke loose.

Oh, and I totally misread the kfence ability to tolerate partial TLB
flushes.  Sorry for the noise there!

--------------Lh9aXApYj7BdK6v1bd25dwlY
Content-Type: text/x-patch; charset=UTF-8; name="kfence.patch"
Content-Disposition: attachment; filename="kfence.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL3BhdC9zZXRfbWVtb3J5LmMgYi9hcmNoL3g4Ni9t
bS9wYXQvc2V0X21lbW9yeS5jCmluZGV4IDIyMDM2MWNlYjk5Ny4uOWI0ZTJhZDk1N2Y2IDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9tbS9wYXQvc2V0X21lbW9yeS5jCisrKyBiL2FyY2gveDg2
L21tL3BhdC9zZXRfbWVtb3J5LmMKQEAgLTE3MjcsNyArMTcyNyw4IEBAIHN0YXRpYyBpbnQg
X19jaGFuZ2VfcGFnZV9hdHRyX3NldF9jbHIoc3RydWN0IGNwYV9kYXRhICpjcGEsIGludCBw
cmltYXJ5KQogCS8qCiAJICogTm8gY2hhbmdlcywgZWFzeSEKIAkgKi8KLQlpZiAoIShwZ3By
b3RfdmFsKGNwYS0+bWFza19zZXQpIHwgcGdwcm90X3ZhbChjcGEtPm1hc2tfY2xyKSkpCisJ
aWYgKCEocGdwcm90X3ZhbChjcGEtPm1hc2tfc2V0KSB8IHBncHJvdF92YWwoY3BhLT5tYXNr
X2NscikpCisJICAgICYmICFjcGEtPmZvcmNlX3NwbGl0KQogCQlyZXR1cm4gcmV0OwogCiAJ
d2hpbGUgKHJlbXBhZ2VzKSB7Cg==

--------------Lh9aXApYj7BdK6v1bd25dwlY--
