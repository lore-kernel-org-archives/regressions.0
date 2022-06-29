Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7011533CE
	for <regressions@lists.linux.dev>; Wed, 29 Jun 2022 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656516318; x=1688052318;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Gp6YtP/tV7OzkJtukww4PZaDDGHVNrVauB6vl/EWvMk=;
  b=lDMNP/WgAYdm9gsfaEjtjo15tFDbOsaTTtdRRe6M5E5FZECPf3/lCqNA
   2ARYgPc6gu+QovKdcDI3DdFgyyjkEawMFbHDpNbTuSgLmmD+useDhsYyI
   FmRWVo2pFPE8JXvN3UFSe9JIDDXzcNuX82zu9GrWAhq4aA9XeSigvCm13
   XwF6SHShdyyXDsziNjSmtOnK7bGnQCeP0EyCeA6HvRWA1mKLNUYo0ZulE
   ysqLEoDuYjDTnuUPaJpPbH6nw79T0AlZi2IPWMWVntMwq8sz48+udItUe
   3Rx+az39TWzIvZrD8tiZuOUKuhmoOwx9a2e0fhoqNLTA5jJxFvBofXHcZ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="280821720"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="280821720"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 08:25:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="693618747"
Received: from djschink-mobl1.amr.corp.intel.com (HELO [10.212.161.74]) ([10.212.161.74])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 08:25:16 -0700
Message-ID: <774e5f81-62e3-79e3-4910-39743c4399e0@intel.com>
Date: Wed, 29 Jun 2022 08:24:05 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [REGRESSION] Unable to unlock encrypted disk starting with kernel
 5.19-rc1+
Content-Language: en-US
To: Alexandre Messier <alex@me.ssier.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Andrew.Cooper3@citrix.com,
 mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
 regressions@lists.linux.dev
References: <6025678c-e94a-6966-e298-82fad658a889@me.ssier.org>
 <YrrHwxtD2dpts7PF@zn.tnic>
 <19f8897b-c445-4e66-49b2-9ceca738a263@me.ssier.org> <874k04e6o4.ffs@tglx>
 <a63bba3a-583b-603a-0a4b-2b329b6af1e6@me.ssier.org>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <a63bba3a-583b-603a-0a4b-2b329b6af1e6@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/22 16:24, Alexandre Messier wrote:
> Sorry again for the trouble, this was not a kernel regression, but my error.

Been there, done that!  I'm just glad we don't have anything to fix. :)
