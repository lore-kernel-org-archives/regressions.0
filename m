Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098656;
	b=CXxLg4k/f7Niczd4rNrUiB2QTuAU/4U4S1KpiKbGVXh/VddlohS9Jjdqr/E5EJ/IY6R4
	 mo51Ri2LiTSVWVEA2JtZ99jo72St+lzVya/Eyyy3aW5PihbKCCZZ7FSZ7bHgp2Y82sqTQ
	 5pJN6CtBO6Q0DvF04rDubdgazbPnj5z53iARd+DbqvDk6T6J8qXBIeeb6PK/5AoUVvA11
	 4bVM38QuvE/12G2tmlfWDxwCLn6gxMjPMcK6QezR1kA/a/maXOnbsWV8RK/lB+g1MQbd6
	 vRLkWzmMs9u00MT5SIl3edNbNqHareo2g4eyZkER5EzwMuwxv2NRF7/jzBtNzU1sJAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5ptO0Wtkndc56jrXe8vZC6WeWMq0MCyqhlLRGNFuMqA=;
	b=A5kzsSjRAWsprvkgOX6MS7ibylEy/TyxsBOv7SkcvHIWG7f5eE8H79u9EVhoGuyINUti
	 E9BHHhOTsWcHTgz65RDykA0VLiJPZy5J90jaqCPGjl7qKSaWdYQp4hqe60eOZ6dT3qI1s
	 NqElkpANjomiEkODi4RqE6mZe988oj8X15HwixDEmVp2vqQWGJ3sdF8vbDzyTPPJldBJP
	 THf5B5po2AAoqB+XeHxGeUUVeDFF3uGTKNqEcbr5SFfIM91Cuclv/1Tpzgp4nfVhDJSIp
	 1u3y0yo98Zy+H2vA9c1Prwy4FEFQOjbdUuEEjxUhreKpHe73ezT/zN+le2XhsLeBNDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jb4sTMei;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4640606A31A
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 10:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4640606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jb4sTMei
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793098656; x=1824634656;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hZnvNktz4cmqYjwd6P72nEMhTEYA27YTbnDIE7u9gRk=;
  b=Jb4sTMeit9f368+Ygu9jLaRsz80r5tH5m8Ki0+iD07RwnzTFcTLT8K4H
   KfB8zPC79danCpGBqnuYZcy/e9JXMItnQDstkDDJc0E5+KUf904GFiJh6
   vxvV1G3LIh6539lpb9/j4Jux9DYq7Stif5978GHztLUaA5YAGVJjK7cEm
   vpZdQLB5Rb75Sdxg734MJP6PPJLpVGKSjJ1Mt6ugXshcphXiHDy/jnP79
   wfyQzZTKYe2KnOnQkRrTzR23JtYo7v5Vt9PSdFy+SfbImDD7uFObHYsde
   1szIgGmnCIfc79m4On971aanXwoJoI+g+aaelsf+77GS9QfxTVOaaU7zy
   g==;
X-CSE-ConnectionGUID: VA/cR0ESReC7BUVH4EuF0g==
X-CSE-MsgGUID: Zs1tjFeoSf2YJk5j5ztvUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1679354"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1679354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:57:36 -0700
X-CSE-ConnectionGUID: bi5GP2r7QSCJYRUSibTvIA==
X-CSE-MsgGUID: 2bftDjWPQGOSOnBzAwNSSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4901520"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.252.51]) ([10.94.252.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:57:34 -0700
Message-ID: <e5f29297-2c89-4979-a760-b5d0c4e1ff8c@linux.intel.com>
Date: Tue, 27 Oct 2026 12:57:26 +0200
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] usb: xhci: clear stale bandwidth data after
 hibernation
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org, Harald Judt <h.judt@gmx.at>,
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-2-niklas.neronin@linux.intel.com>
 <4e7a9bc8-4981-4dc4-bc2b-92579a694177@leemhuis.info>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <4e7a9bc8-4981-4dc4-bc2b-92579a694177@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27/10/2026 11.52, Thorsten Leemhuis wrote:
> On 10/6/26 17:24, Niklas Neronin wrote:
>> Controllers using software managed bandwidth accounting maintain
>> periodic endpoint bandwidth information in struct 'xhci_interval_bw_table'.
>>
>> Each root hub port owns a bandwidth table and a list of TT bandwidth
>> domains, where each TT has its own bandwidth table. Virtual devices
>> reference the bandwidth table of their current bandwidth domain through
>> 'bw_table' or 'tt_info'.
> 
> What happened to this? This from what I see fixes a regression from the
> 7.1 cycle, so it would be good to finally resolve this for 7.4-rc1. But
> I see that Michal's review comment wasn't answered -- is that what we
> are waiting for. And I wonder if it was unwise to bundle this regression
> fix with other changed -- and if it should be resubmitted separately.

Planning to resubmit this separately, after the merge window, with minor
commit message improvements.

> 
>> Historically, resume from S4 re-allocated the entire xHCI driver state,
>> which implicitly cleared all bandwidth accounting data. After the
>> hibernation resume path was optimized to preserve parts of the driver
>> state, virtual devices and TT bandwidth information were freed and
>> recreated, but the root hub bandwidth tables were left intact.
>>
>> As a result, stale bandwidth accounting data could remain in the root
>> hub bandwidth tables across hibernation resume, leading to incorrect
>> bandwidth calculations after devices were rediscovered.
>>
>> Fix this by resetting all software bandwidth accounting state in
>> xhci_rh_bw_cleanup() so that resume starts with a clean bandwidth state.
>> This includes 'xhci->num_active_eps', which must remain consistent with
>> the cleared bandwidth tables.
> 
> BTW in case this needs to be resubmitted:
>> Fixes: <2a70e5dc0301> ("usb: xhci: optimize resuming from S4 (suspend-to-disk)")
> 
> Drop the "<" and the ">" please.

Good catch, I'll fix that.

Thanks,
Niklas
