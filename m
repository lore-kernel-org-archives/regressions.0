Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9A872
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 01:07:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="215438369"
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="215438369"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 17:07:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="510088158"
Received: from askirtik-mobl1.amr.corp.intel.com (HELO vcostago-mobl3) ([10.212.223.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 17:07:16 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, Stefan Dietrich <roots@gmx.de>
Cc: Greg KH <greg@kroah.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, regressions@lists.linux.dev, Dvora Fuxbrumer
 <dvorax.fuxbrumer@linux.intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, intel-wired-lan@lists.osuosl.org
Subject: Re: [REGRESSION] Kernel 5.15 reboots / freezes upon ifup/ifdown
In-Reply-To: <20211124153449.72c9cfcd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <924175a188159f4e03bd69908a91e606b574139b.camel@gmx.de>
 <YZ3q4OKhU2EPPttE@kroah.com>
 <8119066974f099aa11f08a4dad3653ac0ba32cd6.camel@gmx.de>
 <20211124153449.72c9cfcd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Date: Wed, 24 Nov 2021 17:07:16 -0800
Message-ID: <87a6htm4aj.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Stefan,

Jakub Kicinski <kuba@kernel.org> writes:

> On Wed, 24 Nov 2021 18:20:40 +0100 Stefan Dietrich wrote:
>> Hi all,
>> 
>> six exciting hours and a lot of learning later, here it is.
>> Symptomatically, the critical commit appears for me between 5.14.21-
>> 051421-generic and 5.15.0-051500rc2-generic - I did not find an amd64
>> build for rc1.
>> 
>> Please see the git-bisect output below and let me know how I may
>> further assist in debugging!
>
> Well, let's CC those involved, shall we? :)
>
> Thanks for working thru the bisection!
>
>> a90ec84837325df4b9a6798c2cc0df202b5680bd is the first bad commit
>> commit a90ec84837325df4b9a6798c2cc0df202b5680bd
>> Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>> Date:   Mon Jul 26 20:36:57 2021 -0700
>> 
>>     igc: Add support for PTP getcrosststamp()

Oh! That's interesting.

Can you try disabling CONFIG_PCIE_PTM in your kernel config? If it
works, then it's a point in favor that this commit is indeed the
problematic one.

I am still trying to think of what could be causing the lockup you are
seeing.


Cheers,
-- 
Vinicius
