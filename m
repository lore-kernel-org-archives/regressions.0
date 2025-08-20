Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3695952F66
	for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755683646; cv=none; b=ayHzwOV5ry5eAm/fFKjI1KysfvxxUdfikOvTQe+mXoiIZen/Z46roLk0JM/hV7OGd7ack8m2PGHrqv3S6geVkq8dUOXU+6vWcKgKxugFbwaxJaUPRXPVxgQMYfAttWYhpkp6jhhMQD0QksUsvTpED290qPMKbc1ogz/B6dXQBts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755683646; c=relaxed/simple;
	bh=vDVpIvRwYFWKqMyIkI29+GnwldOzxNJ855+dvbbjCRc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=a/DQQitKgXigixo6a34OP2ls1c3lBx8mpnSUeN62zTaGstcm5vVkWPCVgPfLsr691k4DfoSB5ldUIywC9v1mK9mleomS3GAudgQYCHB81pVIsYwyadC6+aZKecfiaYXBB2bXydjhnOxkCkq+U0f0E+8exnDuR+9EW0rtOl5K20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=yfxtZ8Mn; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="yfxtZ8Mn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=vDVpIvRwYFWKqMyIkI29+GnwldOzxNJ855+dvbbjCRc=; t=1755683644;
	x=1756115644; b=yfxtZ8Mntw4s5e/f/vtwX0MVibsObCHQndUu3yZCREtWlqh0d6ZvOwTXsYNDG
	smASDvi2vRluZlCqHeNmvuqVic9SuzYrtOuxc59+cnQQu7qGNBlaDFipet+bngiBb2axO9uznVFBr
	L71EFrr+xhkzCP7D1xk4/ME39l+JOY7DzxrEdD1O61sFTjqc32f4ewkoC9b2MsgurWMqNlmNao2lw
	Z6qW1MNAZbR+WM2c1jbkkpcpP2fzfjU0u6JQ+tZHm4ukgWF3YIFU0eKMk3Zktb8Q7JLIRc6Abwyku
	tbU1sJPKp9d/a1bvlgwWDjEFLHJvmniwALo3L2eVzbxKjz8mQQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uofW6-004Ubx-0s;
	Wed, 20 Aug 2025 11:54:02 +0200
Message-ID: <272be3a3-967d-4221-a6cf-c71cc6f457bd@leemhuis.info>
Date: Wed, 20 Aug 2025 11:54:01 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1755683644;19c54f87;
X-HE-SMSGID: 1uofW6-004Ubx-0s



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/netdev/Z_z9EjcKtwHCQcZR@mail-itl/
#regzbot introduced: efaaf344bc291
#regzbot dup:
https://lore.kernel.org/intel-wired-lan/CAMqyJG3LVqfgqMcTxeaPur_Jq0oQH7GgdxRuVtRX_6TTH2mX5Q@mail.gmail.com/

#regzbot report: https://lore.kernel.org/netdev/Z_z9EjcKtwHCQcZR@mail-itl/
#regzbot dup:
https://lore.kernel.org/intel-wired-lan/20250626153544.1853d106@onyx.my.domain/

#regzbot report:
https://lore.kernel.org/amd-gfx/f2b70e6e-bff6-42f3-82a2-81eed892cc30@linux.dev/
#regzbot fix: aa5fc4362fac9351

#regzbot report:
https://lore.kernel.org/dri-devel/0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech/
#regzbot resolve: inconclusive: corner case and fixing might not be
worth the risk after this time

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219143
#regzbot resolve: not worth tracking anymore, sadly fell somewhat
through the cracks
