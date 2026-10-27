Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.244.194.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117798;
	b=SaLEElRKgAGPFS5htpkh+iNN5SQRnc/uoJkTcq0QK8S8VKrWgMR1VIqs4SXSVhulgyw6
	 pGz8QfeTjocExKC176ssN8b7gd9j4S5swS1RLSeLrDuzuJOkGHF5hIaC2znW8GXSpapMe
	 qkg/T/eVaoE0AtMXUzv5SvrQDAoTaBe4jzqbfduIGI+3dlpVgp+BKdR00BC11Qk/lvpuC
	 eK4lEZCOIoO4m+GYw4dq/Lh73P3Pe4aFH5+fXEbhIwVOrJ7xVi9/hcwbq9lDbsSA23DM2
	 rMjfC1Yv4OJfJghIT0TfnOtZh2dhb8ruGducXr9/Ye9mgftPxKyXRzr/A0dEDQ7ShnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=Ud07PxyxiE6IQ8paYqTpGoidnwlbyZ5U8e73PR8p8tA=;
	b=3MtY9ff6B9hsTvfyg/ZlUN9Tz1T1QhoLP2YzW60byqsQnwyJ5Ya9JmurpIPg+UmE6CrZ
	 36AdoZkOdypgmL/3TqtqCGPT7hnTdo+QH0wpQMDbHvhMtB2CqbC0Ccc0BgA26jBOm+b4U
	 lOUAsdpFp4iU2EaTzS+PdjR+KdQi5oYyoQsUUp167yD64JqjKz9GASP7ZKkSICV4MI/M2
	 6YkP4ybcc1p5suaCma2Py77bNXBhRx/vPJ9aL4AF+7OE4a/0TrzgQacdj3xTKmaWGTLbj
	 kqdlg+jXWWrX+zpvI8eo1DRurKsNepuMwm4sZOdVlg/6MDHNzkG5XrQ3q7OyyEd86DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=fOAVOpgG;
	arc=none smtp.remote-ip=185.244.194.184
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A361606A31D
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 16:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A361606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=fOAVOpgG
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jDbGW1fkFz9P8S
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 17:16:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793117795;
	bh=Ud07PxyxiE6IQ8paYqTpGoidnwlbyZ5U8e73PR8p8tA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=fOAVOpgGr4I8qjK0adNKymdYUSOhTfVLr1Hp36S/8N//94mq4kiM5tP0sjIDeQRKA
	 efJsxPFSfkloQ9eoG2+L4U/vCzf4McalXs78alkZfs0gn0+2P0SP8MLyvjGN3hW/Bz
	 5c4FziHbCaoeDTPZmSWdlZ79ym/AFPZiIabJFaaYrGAE4ZFLQZFL/K8bUr4OL+Crb9
	 CuIZLYTtCWKFknIQrOKJXlkF7cN5N0IduedcZpRomIS1JAe1FfZLp894vHPjhZm5p0
	 XNX+QuRZowWGMi5znl0RvD36hN0WEqtWbgRunOzGnjK1Tjk4kjulGbAXxsjn/XjMGb
	 5pDsyKmhYxNZw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jDbGW0z4Xz7wp0
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 17:16:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jDbGV3Kvdz8tjL
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 17:16:34 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BB1CB5FA19
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 17:16:25 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <66a59169-a0a2-4e07-a2c2-39d1ab16052c@leemhuis.info>
Date: Tue, 27 Oct 2026 17:16:25 +0100
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
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179311778594.3270278.3966410372725825883@mxe9fb.netcup.net>
X-NC-CID: TOeCKfdniqsx2HJeoDiaKGLRzNkJEnnglHhyHNB6D20nvxeiYow=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/regressions/179291154395.445511.11371466163163680530@kernelci.org/
#regzbot introduced: cec3598305a6

#regzbot report:
https://lore.kernel.org/lkml/00cb01dd3099%24c82b66c0%2458823440%24@zadarastorage.com/
#regzbot monitor:
https://lore.kernel.org/all/20261020174435.1527425-1-nirmoyd@nvidia.com/

#regzbot report:
https://lore.kernel.org/stable/477e5184-a041-40af-8648-11e346ac55f9@leemhuis.info/
#regzbot resolve: inconclusive: lack of feedback, maybe moved to
https://gitlab.freedesktop.org/drm/amd/

#regzbot report:
https://lore.kernel.org/lkml/20260930144650.3701516-1-stefan.roese@mailbox.org/
#regzbot dup:
https://lore.kernel.org/lkml/20261002091029.2225203-1-stefan.roese@mailbox.org/

#regzbot report:
https://lore.kernel.org/lkml/8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrussian.pro/
#regzbot introduced: 7a0886826308


