Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18DD366DDB
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776697816; cv=none; b=Q+r0RLRGhKFVciU8WilFyGHI3q48x7aLo79NOZ0xcf2ovJywKgVSUjfCSfLvGQNYMecExKgR0h8TLPG1CS74RvNmGT9peFVzAWTf5sSCFEq/Wmv54Wglt2WaczslgFrhsftdrIKgjw2qbLkwGOF/NyY921vCG6hw9j+ND8hXgAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776697816; c=relaxed/simple;
	bh=1A2gZfmuuFzMfgpSkaTph9ulEpUua3g24igjYTyVDlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvPxhbAp/zdJogVJ/pFuxG0j2ur/YbdklaBahXcBh8zbV14YA/jZ8AadFp36LmdZpeh41DB91fgSdw15sWvR05SkcV4aLyQCK1vqR1usRJGADHpL8egE+bXTo0le94CnFCWPdp3SN3zNP+xi0v0TywzfTRkyjKaYazaDWajcPDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OLE7xbFZ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OLE7xbFZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1A2gZfmuuFzMfgpSkaTph9ulEpUua3g24igjYTyVDlc=; b=OLE7xbFZY3StImkpQ6yGjH9dK7
	uytiRiucDEmTX96vYeKtGbvSsN7OTADf6FiSwaiFppxE8ecWXzbHzvEguE/mc7wtQI3efus/RvUSO
	OjgaLqmdT+TBvGoLO6tmIPeVXBZq7VRKFbucGiC+ktqoo5g0slZtytMTgdyWIuxVuGRJnhOB0pVE/
	sFOYAEKR7KsQZyN67iKoxiGZwhAGVQl+7n3qAKS7weB1htWwWfWFAMZk2PtlzhtiKCrAIRUCEUPLa
	zasHcs7Zpf6L4Uq29eLsvs/Q5KIoIwdP9NIFjb7tIIcMDK027bY3Oht5RJ318qWrsPI4XxgpxrTnU
	A0pMyMiw==;
Received: from [186.208.73.228] (helo=[192.168.18.14])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wEqGB-001DeD-9d; Mon, 20 Apr 2026 17:10:03 +0200
Message-ID: <afa2404c-03b4-4293-aaa7-7ca2f8002f9f@igalia.com>
Date: Mon, 20 Apr 2026 12:09:56 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Ivan Sergeev <ivan8215145640@gmail.com>,
 Mario Limonciello <superm1@kernel.org>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, regressions@lists.linux.dev,
 mario.limonciello@amd.com, alex.hung@amd.com, daniel.wheeler@amd.com,
 rodrigo.siqueira@amd.com, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, huangalex409@gmail.com,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
 <DGJFVPAQJA15.378GMU7XZXLU@gmail.com> <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
 <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
 <DGJH30US2XMK.S2HOHR14LIW0@gmail.com>
 <bed447c7-07a3-46a8-9bcf-da352810883b@igalia.com>
 <DGK98QFUDRR2.1RCLDXI8XRBFR@gmail.com>
 <f0b79dd8-00e8-4352-b9ac-20ee6c114086@leemhuis.info>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <f0b79dd8-00e8-4352-b9ac-20ee6c114086@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/04/2026 11:48, Thorsten Leemhuis wrote:
> On 2/21/26 02:39, Ivan Sergeev wrote:
>> On Sat Feb 21, 2026 at 1:47 AM MSK, Melissa Wen wrote:
>>> Can you check if the attached patch resolves the issue?
>> The patch does resolve the issue!
> Melissa, was this ever resolved? I saw that you posted the patch Ivan
> tested as RFC here:
> https://lore.kernel.org/dri-devel/20260223203528.213275-1-mwen@igalia.com/
>
> But from the outside it looks like nothing happened since then, which
> made me wonder if this regression was ever resolved.
Hi Thorsten,

It wasn't. I didn't get the necessary ack...
Let me resume the discussion.

Melissa
>
> Ciao, Thorsten

