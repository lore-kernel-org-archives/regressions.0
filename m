Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F862EB849
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342163; cv=none; b=nF5+c9tgXnlFW27ZPuZTVsbpaqRzh7sX60EiQYKyeMEnJ5wke2JZPafsI3RUUfnZtTigGCSsHRgmtSpKOlOl7ny1TN5hyW7W5kYZfFhiFZ1ne6xJqU1UFPQuahOjj/QucFvUW+5GCQhyUOTn9CnotRn+90sSAF7lZCj4EzlMG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342163; c=relaxed/simple;
	bh=p+PaJfRi1WCR9SU6BVGd3F9l+uM7iq+JFum96KFJxnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwjwAl6cjDK0zjuTfeMHSWgLATOuhZ+IMOl6tew9NK9sYszUTk2r4jqxGHgPmECu8Q9jwVxAEo6zRzRW0IRUGTI55N2Aso3remMQmkxVZfY5ZNQZ8iRNyj46I2EYHFOTxc0s0WxtbaznYge40MjW8+ijDwzHgcLoX/T+llbOOFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioClWtm3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioClWtm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760342161; x=1791878161;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p+PaJfRi1WCR9SU6BVGd3F9l+uM7iq+JFum96KFJxnM=;
  b=ioClWtm3aKqZ8pTGDGNRWRstiMeRuUuH5MFgJ/wHX5rBvBtfDdcg4amW
   aHOePlhyS2oZfwsMSyKADfr13WGfnJccWozYM66j+I52Ycu7gaZvitp1h
   ZYaTZeTkR0BE8O19qGlpxTFVY1d4yZztebrTY6QE7eulm6BOpskDraRNs
   USJ+BltUwSrbO56TOz4RBYzxZ0gILjfp+2+SU/XG791qPQgqhgmqcOBhG
   u/TdDu2jN3v6Wc/dgvuyDtDq0nPzNCNOsDtvlRFW7w7HVXFX5TUB+OHig
   I+y7sWNeImItatlrVYyqYP/Ub1g1aM88YXRKyKGHl+fGL6JdzFmRT2u0K
   g==;
X-CSE-ConnectionGUID: igwjbKgBTvyor8Bl3WkMRQ==
X-CSE-MsgGUID: s8NJc+sjTYyOgyS9xYBYHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="87933643"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="87933643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 00:55:58 -0700
X-CSE-ConnectionGUID: ZaQ3rjWIT5qXV1zfh1IH+A==
X-CSE-MsgGUID: Iefzp6W7QeOJT5m3MP2iBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="205221901"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.60]) ([10.245.244.60])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 00:55:56 -0700
Message-ID: <21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
Date: Mon, 13 Oct 2025 10:55:54 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH usb-next] usb: xhci-pci: Cleanup xhci_pci_setup() for
 shared HCD
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin <niklas.neronin@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com>
 <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com>
 <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com>
 <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com>
 <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
 <20251009131444.2c221922.michal.pecio@gmail.com>
 <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
 <20251009152703.72e780b4.michal.pecio@gmail.com>
 <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
 <20251013092250.699bf60f.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20251013092250.699bf60f.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 10:22, Michal Pecio wrote:
> This function will be called again when/if the shared HCD is added.
> Little to do in this case and there is no need to set some de-facto
> read-only properties of the xhci again, even if it was harmless.
> 
> Don't bother passing the unused xhci_pci_quirks in this case either.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> This is an alternative to the cleanup discussed last week, which
> doesn't require a v2 bugfix. But I also have a v2 bugfix ready if
> you think the original option was better.
> 

Can I get both :)

A v2 targeted bugfix that I can send now to 6.18-rc, tested by Arisa,
making sure the regression is fixed.

Then this improvement on top of that, which we can send to 6.19 after
it has been sitting in next kernel for a while, making sure there are
no new surprises

Thanks
Mathias


