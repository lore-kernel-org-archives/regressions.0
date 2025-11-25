Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E41E2147E5
	for <regressions@lists.linux.dev>; Tue, 25 Nov 2025 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764086605; cv=none; b=P/NTRI1WgkuuZKRwhwCp4CJnYFNeUpU5kMAt7Site9am3pDOqwVSaFCDj8qebzdvWivrLa0xISBhPl+cuWGTZZFeYFnvcBnQ3ianVEAne04thob/YmBY8rhmPd+j5PLMePF4fsDlyVD8Q00dAw0PjDBHHd3jyosOynz3HYJt2wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764086605; c=relaxed/simple;
	bh=7Nd7EYRqrXtzC3yN4iiu97MFk+wkxsxOhBNXKnjbLMA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=TdX8wfNa6qYOCw/iB933auTkFU7NvhOM6bFBgiWI5OGrapB13V8DM8M0qVmCl6caDXryYhYENVxd0YS4wdBfrya1ZFKVVkQeExIc4MhCknMhCmLI0m2w+VQ61AFfuKSrPjGbfzzCSbMycSLYLHBRQWdseoJALVF/ZsdUGsxG0Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CAwMOz1y; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CAwMOz1y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=7Nd7EYRqrXtzC3yN4iiu97MFk+wkxsxOhBNXKnjbLMA=; t=1764086603;
	x=1764518603; b=CAwMOz1yIQORvCOPuhmYDVR17lAZOKfDldQC7RqgM0iwTflTnbNJ8uIXmLgQ4
	YcCB1pfh85haN97JdXRN7PrSTRa1pvmEeX+3oOCdg9ADimTaiyFkbCjuNQ3hbOI5V8b1WsnB+yMc+
	rdDVYEjN+IfL7yaklt16tFWY04GNTREkj3hRABykadSXNc9o0a21nE+JbFztcBJTDUSh40/GSNgr+
	U9kciwiSqzF/oWFuQMeizHdsEhp3EbPEN5CRPlDxSi4J6UQpmph1rgV7yw+Zse2UaMVR9ie8rYLKZ
	/EiRfPNk4MagTI6a3vEYbIC7QA+FHQ+cSNG42oUJ5ggZupgNHA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vNvVb-00EiUv-22;
	Tue, 25 Nov 2025 17:03:15 +0100
Message-ID: <e4983719-0870-4858-80b8-983a3e865d78@leemhuis.info>
Date: Tue, 25 Nov 2025 17:03:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1764086603;01b36b11;
X-HE-SMSGID: 1vNvVb-00EiUv-22



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/jOB6zqCC3xjlPPJXwPYPb4MxHJOhxVgp380ayP7lYq-aT2iA5D8YCdMeCvq5Cp_ICZmqjpfgX8o9siQdlPu9DY4qgnL_zCjgqP23fXc-P4U=@proton.me/
#regzbot fix: Bluetooth: btusb: mediatek: Avoid
btusb_mtk_claim_iso_intf() NULL deref

#regzbot report:
https://lore.kernel.org/lkml/g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu/
#regzbot fix: MIPS: mm: Prevent a TLB shutdown on initial uniquification

#regzbot report: https://lore.kernel.org/lkml/aRYjk4JBqHvVl-wN@eldamar.lan/
#regzbot fix: uio_hv_generic: Set event for all channels on the device

#regzbot report:
https://lore.kernel.org/stable/F84F6626-B709-4083-9512-5F48FE370977@amazon.com/
#regzbot fix: Revert "NFS: Don't set NFS_INO_REVAL_PAGECACHE in the
inode cache validity"


