Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A9615B54E
	for <regressions@lists.linux.dev>; Wed, 10 Apr 2024 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754208; cv=none; b=EO0ODSRTFD1RadHF/8VgrdO3jugvC3wGNNrbhffYKAlsnxmL1HlUxvwyAqS8pcA7xf0f2Rb73olYUCPhRFTXeIsdT2MKSMrBN35SUYEnPmvVvCzpwte09e6SZzSx7z1n2PFK1c3h+OlUHUgMgxILzzuqt0+1hr0uQwQ/7EDHNFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754208; c=relaxed/simple;
	bh=UW+YjKe/SSODcQQ6LYMimv0tZKSU2Le4NnPmmrfldhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W26C7SW03QS9EP4V40jOibM7fslhM8dLwSd72M/2np8G15geFupw4u2Ygmuy93wYGKaniYO/OrxCXpG0+aEGV6yTIAXf2xSRhG7H4HSbF0JeNIVHPfbI/3LI/A8J4t32S8/TWlKDt1aaR8WvQkFpQEyYHWfbwBcRtNzJc8SZpEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmoWUq/S; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmoWUq/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712754206; x=1744290206;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UW+YjKe/SSODcQQ6LYMimv0tZKSU2Le4NnPmmrfldhY=;
  b=AmoWUq/SSPNbCBYlQMwek4LSjP3hiwH36G/Y7WZdSiVem9Zjgk/33h6V
   J70ejfZ7dX4qAHsYM9fjWAqXT37l4o41LkdUg6t2Aq6fJuIUDbdFsREfi
   JRfUVVrbAjT8BMnesMeH+epUSkF4q19tpmaWHQYvoN3TBh0PScHjejfW9
   8T7vlug0h3u74SQlSh8EKxAH+WBqrHsdkm0t9yPGGAtcQ/mYE7YG/0PJq
   C2lD/76ZIR0UWiAxpBr7ruEOtA+TGKDfay/0nGyL+8vhbnlEYFU6Rf+7b
   p2H6vzzOooSemHzPNP0O5KAGgfF/1QHRa/gEp9MRrdCia4lgwDPWkNHML
   Q==;
X-CSE-ConnectionGUID: 6E5J9IZORbCtAllafqKeqA==
X-CSE-MsgGUID: yk2dB9/7RFyeTMAZ8SMwAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7971106"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7971106"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 06:03:25 -0700
X-CSE-ConnectionGUID: ZjJTaaeLSO6YKJPNdSTLRg==
X-CSE-MsgGUID: QdEW8+lKTw+h72LHZ2yrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20520492"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.214.234])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 06:03:22 -0700
Message-ID: <52cf2d1a-76ec-48cb-96c3-211fa1eb721a@intel.com>
Date: Wed, 10 Apr 2024 16:03:16 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tinyconfig: kernel/time/timekeeping.c:286:1: error: no return
 statement in function returning non-void [-Werror=return-type]
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 John Stultz <jstultz@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>
References: <CA+G9fYvjdZCW=7ZGxS6A_3bysjQ56YF7S-+PNLQ_8a4DKh1Bhg@mail.gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <CA+G9fYvjdZCW=7ZGxS6A_3bysjQ56YF7S-+PNLQ_8a4DKh1Bhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/24 13:56, Naresh Kamboju wrote:
> The powerpc,s390, superSh and sparc tinyconfig builds failed due to
> following build
> warnings / errors on the Linux next-20240410 with gcc-13 and gcc-11.
> 
> List build failures:
> ---
> * s390, build
>   - gcc-13-tinyconfig - failed
>   - gcc-8-tinyconfig - failed
> 
> * sh, build
>   - gcc-11-tinyconfig - failed
> 
> * sparc, build
>   - gcc-11-tinyconfig - failed
> 
> * mips, build
>   - gcc-12-tinyconfig - failed
>   - gcc-8-tinyconfig - failed
> 
> * powerpc, build
>   - gcc-13-tinyconfig - failed
>   - gcc-8-tinyconfig - failed
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> --------
> kernel/time/timekeeping.c: In function 'timekeeping_debug_get_ns':
> kernel/time/timekeeping.c:286:1: error: no return statement in
> function returning non-void [-Werror=return-type]
>   286 | }
>       | ^
> cc1: some warnings being treated as errors

Using unreachable() in the default BUG() seems to make this go
away.

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 6e794420bd39..891bd9b0be70 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -156,7 +156,7 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 
 #else /* !CONFIG_BUG */
 #ifndef HAVE_ARCH_BUG
-#define BUG() do {} while (1)
+#define BUG() do { do {} while (1) ; unreachable(); } while (0)
 #endif
 
 #ifndef HAVE_ARCH_BUG_ON


> 
> steps to reproduce:
> ---
> # tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
> --kconfig tinyconfig
> 
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240410/testrun/23380322/suite/build/test/gcc-13-tinyconfig/details/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240410/testrun/23380301/suite/build/test/gcc-11-tinyconfig/history/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240410/testrun/23380301/suite/build/tests/
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

