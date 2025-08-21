Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490C6338F46
	for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783319; cv=none; b=e/eozlf4IEyVJaKt4p9wMxZxqWcqP2uqE0YVvznMWaEMuAJJBDrOchh6SUjwz/8fXZj7aYLzrBTAp/bAw9St57G1ApnpaT44QTFWvgEMweA6VNdgPF3CdGpU+RSBrxoCzrs7+WscLVoyy3gMg77qG+qPEqE/+OodXqbWcFjy8Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783319; c=relaxed/simple;
	bh=s9ts8WLlqRUZJwryY+Z8XHhz4myedWc8ja+bhFxo3vI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=uwt2GMWSI37P2YFub274YRTSjeUZlaxPwxA+rNklc0VJGv3QrlqBgcWC7h+OVnSqfb67sy7PAlVxRPYuI34B6vKCX/XZY7czET70mOect2j+7xTltrFfrdL66X+TyCZjE+CBucmB6kOjECo4ddI2fhM4EY7G0yufht8F7UqhjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=DI2jQkEp; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="DI2jQkEp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=s9ts8WLlqRUZJwryY+Z8XHhz4myedWc8ja+bhFxo3vI=; t=1755783317;
	x=1756215317; b=DI2jQkEpTnE+pg5P7i3ITtXblclxtI22L1WU6tu1PGQb3gnBm7EAzp8j3UU1a
	Y3wcg4jigU0DbRQsSFQH3Sk4PBJJc+zPhVnu1GFkwFMGi6P6gqLGzc77HX80FQFEsmP/pl79diCW6
	2WTddnFIXBMG4rkULe4sm/SDnUn5NtTCinl25gHQNHvA/GjIYOuU6iMA+ZF81qHYTFvM5sp4uFinC
	MUAEVtFAgd5bDJoQ9E041ZKk7X2kohJ7yyDmMeTw4QnS+Nx56A2ZdI+mrj0k8O+eLmMsjnl1Wo86n
	yd+BdmNcAaJ5x2hRkbDc8FlsuVvzoiwFHZfDw2w0ynvZrAw1tA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1up5Rj-009SIy-1Q;
	Thu, 21 Aug 2025 15:35:15 +0200
Message-ID: <be6805df-cace-4f38-94fa-208eeb4d8844@leemhuis.info>
Date: Thu, 21 Aug 2025 15:35:15 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1755783317;67c0f0ca;
X-HE-SMSGID: 1up5Rj-009SIy-1Q



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20250814155515.GA331116@bhelgaas/
#regzbot dup:
https://lore.kernel.org/all/20250611101442.387378-1-hui.wang@canonical.com/

#regzbot report:
https://lore.kernel.org/all/20250815195616.64497967@chagall.paradoxon.rec/
#regzbot introduced: ff7ec8dc1b6462
#regzbot summary: network interface monitoring with xosview and gkrellm
stopped showing network traffic
#regzbot fix: proc: fix missing pde_set_flags() for net proc files

#regzbot report:
https://lore.kernel.org/all/20250820184603.GA633069@bhelgaas/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=220479
