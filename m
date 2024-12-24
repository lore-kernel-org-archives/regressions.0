Received: from srv08.itamservices.de (srv08.itamservices.de [138.201.137.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D918E764;
	Tue, 24 Dec 2024 21:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.201.137.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735075301; cv=none; b=mYdQ9FkkB0+YYm8IJuxJ2FqHnbvQmMZA3rbZRkSkVHOL87IRxIAB1PvS1zsRGYZ4RqJTu3BGbebl6/vih/z5v9IWFy7yPaZ8VL4MN6lN7wIvSTAYWT/0LeAmCOrF7UmSOYwngrkdtZ7izMpkA6OADzTjsGc708AYYaX7JE9YkVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735075301; c=relaxed/simple;
	bh=EuLJvtihdyHUKnuSbQb2ty+wfUEMP10v9yIfEpbQSU4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mpbvwJmaTzyu6nFjKzPKJvbGHU8F1oD3ODieFAXRZGMuzEvl9FepPtAzX2auH39uH4GhCS8EevdBixc1iwgYyKZGrYVpkTJEIj94yakuZD5r3Zu9F6KOtFr9DCDggf06pRd+tMMHhkAdllmugcGA57ukDEHpSP3EuCh7XaFSxoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nachtgeist.net; spf=fail smtp.mailfrom=nachtgeist.net; arc=none smtp.client-ip=138.201.137.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nachtgeist.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nachtgeist.net
Received: by srv08.itamservices.de with esmtpsa (TLS1.3:ECDHE_SECP384R1__RSA_PSS_RSAE_SHA384__CHACHA20_POLY1305:256) (Exim 4.96)
	(envelope-from <debian@nachtgeist.net>)
	id 1tQCLK-006lOw-0G;
	Tue, 24 Dec 2024 22:21:30 +0100
Message-ID: <ebc3f255-2759-42b4-be60-1d69fa5132ae@nachtgeist.net>
Date: Tue, 24 Dec 2024 22:21:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [regression] linux: Loop-mounted UDF ISOs no longer readable
From: Daniel Reichelt <debian@nachtgeist.net>
To: Zhao Mengmeng <zhaomengmeng@kylinos.cn>, Jan Kara <jack@suse.cz>,
 sashal@kernel.org, Salvatore Bonaccorso <carnil@debian.org>
Cc: linux-kernel@vger.kernel.org, 1089698@bugs.debian.org,
 regressions@lists.linux.dev
References: <Z2XKY0f6on1UbwWb@eldamar.lan>
 <b681e1ea-bb7d-4d8f-b62c-cae1e4116d21@kylinos.cn>
 <6c8e6c68-b0a1-47b4-82a4-c68490fdc876@kylinos.cn>
 <0675b760-c381-4f5e-b587-083b8ace99c4@nachtgeist.net>
Content-Language: de-DE
In-Reply-To: <0675b760-c381-4f5e-b587-083b8ace99c4@nachtgeist.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello again,

On 24.12.24 15:21, Daniel Reichelt wrote:
> I just tested v6.1.120 +1ea1cd11c72d1405a6b98440a9d5ea82dfa07166 and I 
> can confirm that at least `ls $mntpt/sources` gives viable output. 
> However, actually running windows setup off a samba share from such a 
> $mntpt gives data errors at the very end of windows setup. I guess 
> something else is missing...

I just re-ran that test on the actual server network instead of my 
laptop and there everything worked fine. I found some SIGSEGVs in the 
Samba log on my laptop from the earlier test so the "data errors" were a 
completely different issue caused by smbd.

So all in all, I'd say the UDF issue is fixed by the cherry-pick. Sorry 
for the noise.

Cheers
Daniel
