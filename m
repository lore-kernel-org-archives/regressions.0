Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C613C9D4
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 07:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398605; cv=none; b=V81C99jK3wq+ruX1b16VwEfWKznJwCoUqAqrwpo5NHeEVwbjvKQKvUtTe+ClMKuWsucRHc4Cu5M/jgdWx3sIay4NvG5CWvnKtyyQb5VkJMvk+OD1xGzPovTGE/1LYQ41f/7eIEPlpLHnEDAnOfU2o1g+JhoG/53hz3NYb6/c8sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398605; c=relaxed/simple;
	bh=s5N35l5clRxrtlNeVoVLCT3ZY3AY1oU49YBogcn/pXs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=XY7Sf/VcwYeUuOhhExACmuqc1frc7CkBtAJkDFAztORLcU5grt/sy+N5o2xYIH+SfuR6sHlws7juQQJP7Mm7vZRl1WuOgjOwpfYW5H7jKtC8SUPWYRJ3T4gF+NCKhf4sU1Ge5exets52d9CxvXbWH/A160UcQC7enZMqkNYXK/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OxgtDp1a; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OxgtDp1a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=s5N35l5clRxrtlNeVoVLCT3ZY3AY1oU49YBogcn/pXs=; t=1724398603;
	x=1724830603; b=OxgtDp1aaPOLB6q6AfxOgQsw3aMx8sGiZBCjF2Nqxte3EaaGwoY9/ldlDTNjh
	T2FkwNLICp9TH6UE2TtUHe52aJSLlsDnh+ORJ/Vccecca+e8vI0E9l22LpPkmtgVnigCUcdN9bKHJ
	vm2FX/vxvLpeEF2PylYiDl9jB4WD3Wy3U/E+bTWMTbV3RqY5bcxygFBoT+6xepkscZ3FtWKlWEguD
	zjlpSRKebKDeJwvMCeH0OEPGt7Szp+33tPJv+AxAJbkIgp6jaPD1vrzU7ZBQ135Nq+fSxTjoc+4z4
	5nBAHcTKuWeiv2Q2iJyCO5H0JemGO59Xe6FhBuVwG9/bT4AgGw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1shOqf-0006Ox-Un; Fri, 23 Aug 2024 09:36:42 +0200
Message-ID: <696cc489-aa38-4dab-b2f2-328dc972a6af@leemhuis.info>
Date: Fri, 23 Aug 2024 09:36:39 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724398603;1acf464b;
X-HE-SMSGID: 1shOqf-0006Ox-Un



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219187
#regzbot introduced: v6.10.4..6.10.5
#regzbot summary: btrfs: kernel BUG at fs/btrfs/ordered-data.c:983!

#regzbot report:
https://lore.kernel.org/regressions/CAP-bSRbx2yWxErkiSf_Ux3Lnm0RGNvZQbpSvrqCcCtb_-aUoVA@mail.gmail.com/
#regzbot fix: scsi: sd: Do not attempt to configure discard unless LBPME
is set

#regzbot report: https://lore.kernel.org/lkml/Zrog4DYXrirhJE7P@debian.local/
#regzbot fix: scsi: sd: Do not attempt to configure discard unless LBPME
is set

#regzbot report:
https://lore.kernel.org/netdev/cabe5701-6e25-4a15-b711-924034044331@samsung.com/
#regzbot fix: b96ed2c97c7919

#regzbot report:
https://lore.kernel.org/linux-fsdevel/597dd1bb-43ee-4531-8869-c46b38df56bd@westnet.com.au/
#regzbot fix: romfs: fix romfs_read_folio()

#regzbot report:
https://lore.kernel.org/linux-scsi/Zr%2FXrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com/
#regzbot fix: scsi: ufs: qcom: Add UFSHCD_QUIRK_BROKEN_LSDBS_CAP for
SM8550 SoC

#regzbot report:
https://lore.kernel.org/lkml/20240803125153.216030-1-gnurou@gmail.com/
#regzbot fix: 6fc9aacad49e3f

#regzbot report: ACPI: EC: Evaluate _REG outsid
#regzbot fix: 71bf41b8e913ec

#regzbot report:
https://lore.kernel.org/linux-iio/0ea167a1-75d0-469d-a79f-ff2cb5e81bdc@gmail.com/
#regzbot fix: iio: imu: inv_mpu6050: fix interrupt status read for old
buggy chips
