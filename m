Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8679214BF97;
	Tue, 21 Apr 2026 06:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776752342; cv=none; b=LYwcDrYEoYvg81F7YaJhglssaK27G73BCqalZu0wATXDe4FmX1oOSi45iaJDeUQiN+efr6vgX699FPCdNcS4d5cxJMAKtphtxQqRV8GGNloRm4FhTHKSdS7yAvtOky6UFpzCJCHQRu3HXT4Oe5bn4WD9mjW3kVrkrbLvjXzKXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776752342; c=relaxed/simple;
	bh=syJPpQ4v1x2aaDXWH1h1Cws/yNnH0XdBoN2bVfu4r8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PbBkCPt7onf6WxYgZcbbwV43owe+Q6aDdF/uyE3SnnSi3L4hVlh83DExm/W0UJx3AlbGOvc/rQ8GyoQc9ZnhneN5rfTWO/0Y9Hgrsnd2VbTGRMs+eLZVesXMxN+sUPf0UplhNK78wCzqN6S0/ZDv3JFHg5ob0bVasaM1CNx84hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nwym1HUm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nwym1HUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD2DC2BCB0;
	Tue, 21 Apr 2026 06:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776752342;
	bh=syJPpQ4v1x2aaDXWH1h1Cws/yNnH0XdBoN2bVfu4r8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Nwym1HUmsFG3djM8WSMt3OBeYGECNHno2ZNJmy6Ae0ww/ZYjZd+I+UvQKl2n0P1Ms
	 Asn+gaENErtgqGFxQI+T21H7nN7UhnjmWU5Y1tNHOUcVk6C5ZbpCzqYOUPkRtMzd2q
	 J1u0miLJAj8+WJMZXgXSVxXrJpLoRpvb5ht+K3zJQRLebHi9jxvOggxvoSolpT28Jk
	 dvlzoL6aF1n/lDGxnWj9lCZsdntQgSrHgr5vAMG2Ak8MShStjb7/EbJ5hZK7tg965/
	 m8gSQCilDfzYCmctd/2J0f0FDp/PsP2zjBIuu81MXMg0o4Lsm723e/IlsLOdZb84DL
	 na55aRTSOFd7w==
From: Thomas Gleixner <tglx@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Hanabishi <i.r.e.c.c.a.k.u.n+kernel.org@gmail.com>, Eric Naim
 <dnaim@cachyos.org>, stable@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: [tip: timers/urgent] clockevents: Add missing resets of the
 next_event_forced flag
In-Reply-To: <5cbb14d8-46f9-4197-917f-51da852d7500@leemhuis.info>
References: <87340xfeje.ffs@tglx>
 <177636758252.1323100.5283878386670888513.tip-bot2@tip-bot2>
 <5cbb14d8-46f9-4197-917f-51da852d7500@leemhuis.info>
Date: Tue, 21 Apr 2026 08:18:56 +0200
Message-ID: <87mrywdeen.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Apr 19 2026 at 17:11, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 4/16/26 21:26, tip-bot2 for Thomas Gleixner wrote:
>> The following commit has been merged into the timers/urgent branch of tip:
>> 
>> Commit-ID:     4096fd0e8eaea13ebe5206700b33f49635ae18e5
>> Gitweb:        https://git.kernel.org/tip/4096fd0e8eaea13ebe5206700b33f49635ae18e5
>> Author:        Thomas Gleixner <tglx@kernel.org>
>> AuthorDate:    Tue, 14 Apr 2026 22:55:01 +02:00
>> Committer:     Thomas Gleixner <tglx@kernel.org>
>> CommitterDate: Thu, 16 Apr 2026 21:22:04 +02:00
>> 
>> clockevents: Add missing resets of the next_event_forced flag
>
> Just wondering: what's the plan to mainline this? I wonder if this is
> worth mainlining rather quickly and the tell the stable team right
> afterwards to queue it up for 7.0.1, as in addition to the two affected
> people in this thread (one of which stated that "several users from
> CachyOS reported this regression as well") I noticed three more 7.0 bug
> reports in the past few days that likely are fixed by the quoted patch:

It's in Linus tree and I asked the stable folks to withhold the original
patch which it fixes, so they can queue both at once.

Thanks,

        tglx
