Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5602D045
	for <regressions@lists.linux.dev>; Fri,  6 Sep 2024 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725639369; cv=none; b=uAcFhN+a4r/QcI5gk18B4k+0cZPoEOm/tqlg8xAPYOcL/wwOeij1PBIYuC5/BBcgA0GVHsZz57IAN5afdjRTlQAnrxE+9pi6o4S9tVZlDxdFuJYrTtADDS+mmv/+v013Y2qG103mp5m/kSZJL4A1l95OHjLi8kwzwHheF8KGkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725639369; c=relaxed/simple;
	bh=PvmzJI3nK+G+EL0TaECFfoHl+gtIXruBJAfwmImHKlI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=sBMXgTj+mvYyNtKqlhYSM8UDzWvGv7TW8F4PGU5gzt00//2gBfYT2dI7QiQdbi9scMffIUcmqwghx8mleIg6waTxo0TmA3ZOqkZuTqSThTtuNdUaTQV1csYWIyBHxu4xzw/ZKxAWyN8mKjj8OSYEl7YG2j3Nhj0ORGQ6VqHqz24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=yztERvFe; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="yztERvFe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=PvmzJI3nK+G+EL0TaECFfoHl+gtIXruBJAfwmImHKlI=; t=1725639367;
	x=1726071367; b=yztERvFeC3Kvq4ZLuqF9Cc5F+/fmUPXkGKlBAnNCAwWKLRTjcZTreeGYQQXY7
	5BfBI2PDB6pEOLXKbA8xgHjy0MefRgm2HpIS2jeamvT6voB3Q9baAot3XFU6RL08VC1/Sc7L5gQdP
	YZVAtbjvp/Mlx+S29u81EGBpaD6EYzK1kWSsAvEz2j1vcaTT/Y+zZpbA8iz0IW09H9MgU7D3qnP25
	/aSDs7I6U9mh9/ifZInAXHV0xCQkwJ77kQNmLIh24jVnHlLiogZogn7vuJGO0ihYBjSsK+ac3xoD5
	llwHaIviOuW+X8G0REQHWFdu+UxO8JBq3aEEHWDGGVCRT2wEEQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1smbcz-00022X-92; Fri, 06 Sep 2024 18:16:05 +0200
Message-ID: <df091f3c-05c0-46a4-915a-28cffebfd339@leemhuis.info>
Date: Fri, 6 Sep 2024 18:16:04 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725639367;6c7da1bf;
X-HE-SMSGID: 1smbcz-00022X-92



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/2a15105f-67e2-42f6-b624-562485b0bee2@kernel.org/
#regzbot summary: arm64: dts: qcom: msm8939: boot broken on msm8939
platforms
#regzbot from: Fabien Parent
#regzbot fix: arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM

#regzbot report:
https://lore.kernel.org/lkml/202408041602.caa0372-oliver.sang@intel.com/
#regzbot summary: mm: -4.4% regression of
stress-ng.pagemove.page_remaps_per_sec
