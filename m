Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C2117C988
	for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724140290; cv=none; b=OJi0nxj762voo8A+JlYJDobLQMvbpa9KofTRoGGOixYyRc2/YXOed9xGMRDIW2OVme76zAtFHTc8zihEYYDzsDeUIOxOCPTCg1h3aXOjXyBSIqqXKYaP39VCJaW0WLy2yWG0lTHPusBJ9KgAB+ueFFhCLDmq2F2GbQs0aTD6tJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724140290; c=relaxed/simple;
	bh=cHDeoexirPex4+Iv4ulRggyv0dA7HBKT2AjzQWC6qDM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=VMk5ic3A4EoMN8CDWSe4mIUJ61W2FKPOBN2iCGMTQ3yKJYEid4uw7v8qQ8gdPGPVluXeSn1n/8xUrX56ozLeAzjBkKSTAou4V1N3J6gl5Guam7Wm6qzrqbSQvSzYSK14V5prAPShOt2OfxCdHWMlcBK2N36HGhUBdnhq/3oHXyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=uz7uDA2p; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="uz7uDA2p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=cHDeoexirPex4+Iv4ulRggyv0dA7HBKT2AjzQWC6qDM=; t=1724140288;
	x=1724572288; b=uz7uDA2patKf57C3R7f5VnKBDCX8gCNd17QIAApCXs4DIVKF6MSG0q3do5on1
	wDRPyPSUorDkM5Rk3H/qTS/vhVQYuTOphkRGbHfond3WofO2OeOKTorq5Uljz7Tc2gYR/wNrby8os
	koSjGEZVKvYIrQWZxY+LSUiho3XuO5YfrbYto3LD8tVamowhA6RN4VnGjS4Don/tsRS6OeW0mpOzO
	RVkuWWCsBpS6nx5QxEaHHIXrWc5IikOyNb1Y/vMMh3SPH6bpIZqX/59P1uea2roMFyPP9hNsNbJVu
	+Z2otPhii6EMvFEZQijQKYKzQFPhGQNax7iKh+5f8u4VTX4nfw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sgJeI-0005T7-TL; Tue, 20 Aug 2024 09:51:26 +0200
Message-ID: <f09fb7eb-ef2f-412c-86b2-a590506904b9@leemhuis.info>
Date: Tue, 20 Aug 2024 09:51:26 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724140288;2e62b2d8;
X-HE-SMSGID: 1sgJeI-0005T7-TL



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219166
#regzbot introduced: v6.8..v6.11-rc3
#regzbot summary: block: hang when when setting echo noop >
/sys/block/sda/queue/scheduler

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219175
#regzbot introduced: v6.10.2..v6.10.3
#regzbot summary: Random reboots

#regzbot report:
https://lore.kernel.org/all/ea1eeb13-c568-4381-812a-dec4246a440e@candelatech.com/
#regzbot introduced: 6b82f4e119d1e2
#regzbot summary: wifi: iwlwifi: mvm: transmit throughput dropped by ~20-30%

#regzbot report:
https://lore.kernel.org/all/MEYP282MB2312106710775098261AB348C68C2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM/
#regzbot introduced: b5b4287accd702
#regzbot summary: riscv: mm: chromium's partition allocator broke
