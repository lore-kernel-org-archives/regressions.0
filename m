Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98027BF6C;
	Sat, 24 Jan 2026 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769236032; cv=none; b=OHD7Hj6q0dc4qd5cfb0mcE2ug0MXK/YBp4qi5P27KRq1O2Yjrg2Uvg2sXHxs2yJECcOJJ5zZRzg6ZKsrkpyC7M6kLa4B2CxCfElnYj9TpAMGCbJvM3F30EJIekcexXX7BxkwXQpOo6zoEIgg9Ed4+OZK5rxZMDe1pZ+G7GzDtkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769236032; c=relaxed/simple;
	bh=pWq6L4MTrOnX5rjLJUJ7TNekZI5bbdttszeCl/8hAEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rz/ThrGKa+seEUWiinUeCanMImVxW7b07+GwKIab12RoidB2dkc5n8kqqE7O1hVJdN49bQ1Bwh+Da7cTxwwH5AbcVcTtklzIVlNKOYabUMVTZHjlTT+cNMF/F6eyohfzu+hdhTjNoA0FravaWaXoY0Zy6KFx7H+4H9MjYIWapKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=xRGVls8S; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="xRGVls8S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ZkIKey9BNK6Uq1yQvzQrwRxwX2OaEdbdOj8Wi+HptBY=; t=1769236031;
	x=1769668031; b=xRGVls8SHrEqWJDw9xX1nxyKkTMkzzR5nOrYvbMGh7rGOLqM5CWLcFkXRZlPq
	X5iMWh7JqPHcjaPHmSESbqF7FuQctARK6CKbpycErnj+sjEBGDpGMAHkkP4R9wSH0T2ShEWchbMw6
	Zf0kgV5W/9OR1RZA8zfW4U40HAoCcV7Xzz6WzA1CRptwT1i5/izL/txsOF1+hDQfwext2Pr+qxcFt
	FmUQYYIsD7dUzMJvvEV5VKuuOOfADxPDLHN7gzFhEjbDpTvjxztZb54UZt5vSbUDBKw/mgYIYPqqK
	LHEL8ppQbiaJmKdX1+L5Kb4KLC5LCxtAb3vhMdovV8X/8WMwlg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vjX6w-007u7m-1s;
	Sat, 24 Jan 2026 07:27:06 +0100
Message-ID: <871d7c0b-e417-45a2-9eaf-f17134e2014c@leemhuis.info>
Date: Sat, 24 Jan 2026 07:27:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Zack Rusin <zack.rusin@broadcom.com>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <9c491fa6-f59d-489e-97ce-b364ce76af73@broadcom.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <9c491fa6-f59d-489e-97ce-b364ce76af73@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1769236031;28a4da86;
X-HE-SMSGID: 1vjX6w-007u7m-1s

On 1/24/26 02:01, Alexey Makhalov wrote:
> On 1/23/26 1:47 AM, Thorsten Leemhuis wrote:
>> Well, fixing bugs right where they are obviously is a good thing.
>>
>> But well, the problem according to the description quoted below was
>> exposed by a change that went into 6.19-rc1 -- which makes it a kernel
>> regression that must be fixed in the kernel (ideally before 6.19 is out).
> 
> The Linux change 34bf25e820ae ("x86/vmware: Introduce VMware hypercall
> API") that revealed QEMU issue was introduced not now, but back in June
> 2024 in v6.11-rc1. [...]

Well, the patch at the start of the thread has two fixes tags – and I
meant the other one referring to aca282ab7e75 ("x86/asm: Annotate
special section entries"), which was merged for 6.19-rc1. And the
description of the patch at the start of this thread also reads ""This
issue was bisected to commit aca282ab7e75 ("x86/asm: Annotate special
section entries"), which added annotations to the ALTERNATIVE() macro.
Despite the use of asm_inline, that commit caused the compiler to
un-inline and const-propagate  vmware_hypercall4(). That made RDI live
across the hypercall, making the hypervisor's register clobbering
visible and exposing this latent bug.""

Ciao, Thorsten
