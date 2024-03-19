Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A25354BE2
	for <regressions@lists.linux.dev>; Tue, 19 Mar 2024 08:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710838677; cv=none; b=khfBWCXSorfnPqVgv6A4pau9CG9bxU/8uOlQwePVON08/2yhJppMkolwTbGQnV0h3gZN65ZyuFCrP+mzzzsNfh51AW9KB9u9jKlN8ec+dByamvWTjJzDaXVtUxwVqFiT3xTm5DHsjrD2ZyzCNSFa45kGt/OZpdD+hO78a2+9VMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710838677; c=relaxed/simple;
	bh=nlFvNrO3+LJlvUE9Beq4h/CvlC0MBi/eTk8quvPJd2c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=M/u4OQHU8gLAYepITxedNNHveWBnkEn5htAijQYYdFvJ9jtv9JHY3WfDs/X+q2kb8AJohYnXOjrCtNCn3in1IpTQylSoL3zCXUKk9yjWqUA4TIg4Cj6i7VTPl8li3iccAY1VFR9vmaeUER4TfScWcagfn7B9nbSXUkykdKoMk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ZQya03CJ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZQya03CJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=nlFvNrO3+LJlvUE9Beq4h/CvlC0MBi/eTk8quvPJd2c=; t=1710838675;
	x=1711270675; b=ZQya03CJrgag1i5CN71YjYA+r6zCRkiCpM70N6KJn+U9OxpeG8uD3QXG9PTPw
	Ahj8bCqaXHQvgArf8frAoa6IpYlhEq4vJ4AJmP0uT6YSBq3T9vyQ7kINHAe9hF/S69U6egiiI/WwY
	nCqXDEL6NFG/JvfVpG8C01KbL5i2tpsN+HvScikLgvUptHs491yHs7gNywb/AV95oUAxlVygmE78C
	PMbxJoHTGRs8jjPJGi7gTl5nNn8rSlFBnYU7AoP12e0DkDaMy3bdYDKfagIh9WJcqHtZqRDCIytYc
	Jkg0B+oQ2wjoTp45+LSKeRLt7ms/WzZzDBv3wo3+ClGhOsAPsg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rmVI9-0001hp-KL; Tue, 19 Mar 2024 09:57:53 +0100
Message-ID: <8e1ac257-8d5a-4c8c-803c-23551814d9d5@leemhuis.info>
Date: Tue, 19 Mar 2024 09:57:51 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1710838675;6cb4e85e;
X-HE-SMSGID: 1rmVI9-0001hp-KL

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20240314084412.1127-1-johan%2Blinaro@kernel.org/
#regzbot introduced: 7dcd3e014aa7
#regzbot title: Bluetooth: Lenovo ThinkPad X13s broken
#regzbot fix: Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode
exists in DT"

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218587
#regzbot introduced: 4d0c8d0aef63
#regzbot title: mmc core block.c: optee/fTPM access to RPMB via
tee-supplicant broken
#regzbot relate:
https://lore.kernel.org/linux-mmc/20240313133744.2405325-1-mikko.rapeli@linaro.org/

#regzbot report:
https://lore.kernel.org/regressions/ZeoAPFIF6NClUl4P@debian.local/
#regzbot duplicate:
https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36
#regzbot fix: 9cbd1dae842737bfafa4b
