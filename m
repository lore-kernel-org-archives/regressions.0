Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D01B29A8
	for <regressions@lists.linux.dev>; Mon, 29 Aug 2022 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661765787; x=1693301787;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=grH/4J/cN7Mpd+sfgzlCpokTKZ4Un8uHFmFcQI849BE=;
  b=FvCk3zlpZUSWJB/NHi3UmY9CHFfJQtEZ4ch9RTrdU9+hXE3uEgFTxT1b
   7ZW+ztmCv+Gi5RuYoBaJIf7SYnyAkyb9dztRwZNDu7O86m4MIZ/UXniPn
   3DnYEz3T9Vn5fHPIiBzrVLpo1YdG5zbj8m+sZZeaSkmmiPTHPPgkn/mC6
   cY+rKM9q2fCxdIfhePoChZb08qm+atPVrltVixfB8KUzDTCJH6CpHm5A/
   rf1OBE9SK/dZdZH7T0BmdCh+M2dA6ozetNdDq3eRobXTE7ldx+YXwNnaH
   +snSdYWe3E+3GyXtgRDFmaPBYTtJZFv9STgsJTckbvfQkFGPqzkwJuQbG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="296129421"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="296129421"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 02:36:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="672313597"
Received: from kvehmane-mobl1.ger.corp.intel.com ([10.251.220.41])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 02:36:24 -0700
Date: Mon, 29 Aug 2022 12:36:24 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: 6.0 tty regression, NULL pointer deref in flush_to_ldisc
In-Reply-To: <4b4bba5d-d291-d9fa-8382-cdc197b7ed35@redhat.com>
Message-ID: <e8d67c78-751e-2c44-edff-e7e441c3302d@linux.intel.com>
References: <4b4bba5d-d291-d9fa-8382-cdc197b7ed35@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Aug 2022, Hans de Goede wrote:

> Hi All,
> 
> This weekend I noticed that on various Bay Trail based systems which have
> their bluetooth HCI connected over an uart (using hci_uart driver /
> using the drivers/tty/serial bus) there is a NULL pointer deref in
> flush_to_ldisc, see below for the full backtrace.
> 
> I *suspect* that this is caused by commit 6bb6fa6908eb
> ("tty: Implement lookahead to process XON/XOFF timely").
> 
> I can cleanly revert this by reverting the following commits:
> 
> ab24a01b2765 ("tty: Add closing marker into comment in tty_ldisc.h")
> 65534736d9a5 ("tty: Use flow-control char function on closing path")
> 6bb6fa6908eb ("tty: Implement lookahead to process XON/XOFF timely")
> 
> ATM I don't have one of the affected systems handy. I will give
> a 6.0-rc3 kernel with these 3 commits reverted a try tonight (CEST)
> and I'll let you know the results.
> 
> Note I can NOT confirm yet that these reverts fix things, so please
> don't revert anything yet. I just wanted to give people a headsup
> about this issue.
> 
> Also maybe we can fix the new lookahead code instead of reverting.
> I would be happy to add a patch adding some debugging prints the
> systems run fine after the backtrace as long as I don't suspend them
> so gathering logs is easy.

I guess this will help:

https://lore.kernel.org/linux-kernel/20220818115026.2237893-1-vincent.whitchurch@axis.com/

-- 
 i.

