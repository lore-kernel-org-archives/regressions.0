Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C412E48
	for <regressions@lists.linux.dev>; Tue, 11 Jun 2024 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718117995; cv=none; b=IC9euQCifyBR+nw6Qd7Mi4TQGGpQ3KbBY+Nlo1rmcqcz0m7baYWAJMq9ODoqIHpPfrjN966/FVnQPPXxfc2E00WPsSQpgTbDzQlfvwGjisrJ0E8xmfqVOcTyJBLdxUQM1cqOtuL2HFb4+uR43PjBDy4qphB9mu67p4dZZUTsdZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718117995; c=relaxed/simple;
	bh=lhKElJHUkDgZ+Z9nw8Vcknsnm0HYGSk7pzbv9H/nI3I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=N1PWcrX5n3jg+4Jt/7IWKT/VzCNROxPi5FjiW3GfLt6R7yln76A18VRdxWZH2I0i0fZiNvirsagdTjM1aocMLHVi/uavlFk8X1zoV5cZ9yzTpiAsNzVHWBwdCxpfPot/yfrSfUWpgZzjyR+lB53mndk1CNjwL6Yj1toU2ykBJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=dGJ7WP0A; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="dGJ7WP0A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=lhKElJHUkDgZ+Z9nw8Vcknsnm0HYGSk7pzbv9H/nI3I=; t=1718117993;
	x=1718549993; b=dGJ7WP0AJyFHYLsHFZzyhisAxss/VS7n+LE9XbLOsKGcNmphHnGEC03t7moFb
	S0uxWyCqZkZtkrJu6t8FLW1e76FuFhJU65xgTlP/WzfHS756i3SQw0uQ+FOpzqkeHlK839kmBqnQV
	7HMfyJ/Dt+VBYUBo25CX+inQiBSCvdtyfRMRizN+yEY4RAY/yfovmXdx6hkVQVyVMU4wjszlSxuPr
	Sk6tQob/HZQ1Nu0mpMl4UWcPdjp2Id1Gi3obOog3NsLLQk60FsCK2HJVZQYr4uhFYfx4nV+jAFTMT
	CRcX6ac5pTsGICALMSh/JUrJim/Z2jVy3HOXdLJja9wCZyQZNA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sH2yV-000283-C6; Tue, 11 Jun 2024 16:59:51 +0200
Message-ID: <1b79fc84-588e-4ff1-8034-8fc99686f831@leemhuis.info>
Date: Tue, 11 Jun 2024 16:59:50 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718117993;3bf1694e;
X-HE-SMSGID: 1sH2yV-000283-C6



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com/
#regzbot fix: Bluetooth: fix connection setup in l2cap_connect

#regzbot report:
https://lore.kernel.org/all/20240601132459.81123-1-aford173@gmail.com/
#regzbot introduced: f3d9683346d6
#regzbot summary: drm/bridge: adv7511: Intermittent EDID failures
#regzbot fix: drm/bridge: adv7511: Fix Intermittent EDID failures
