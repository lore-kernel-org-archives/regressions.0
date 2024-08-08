Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BECC52F88
	for <regressions@lists.linux.dev>; Thu,  8 Aug 2024 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723149234; cv=none; b=TC2S4dDisMDsxaB30RIstKHr50D5sq7wu2qI89TDbbCZCz9KbTPm+HYTl/Jj0mX2MKmEX9SVprzhpy4GAN/VQ/fMxkGwUNL9fTM6yaap3lfuNJF/aFFNKDVk9Foydr5CczHXonGd53qwtAUn+qcIWUa6d+fl2O4MNDyY9vdMgqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723149234; c=relaxed/simple;
	bh=seHn3hgu6UTSmqAcAi0Wir9GGPHWi4I0PsaQ9xlGd/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8DC0n3a8tncTyxBGpVh/g5HGc6s+MPwwznupEBei4Ijo3VlkYLVSB5hezvp/hnTQAI1gMEndfzoAAm3Zsjqk2SClAQWd55ucq4eBZerGvZgDTUa6VZ00VV9tiDzJWgYzdhuFG84LQE6+7AYEb5iG59uuT/OjB2fARIyLPifnB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibk4WNEV; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibk4WNEV"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e0857a11862so1363226276.1
        for <regressions@lists.linux.dev>; Thu, 08 Aug 2024 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723149232; x=1723754032; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=seHn3hgu6UTSmqAcAi0Wir9GGPHWi4I0PsaQ9xlGd/c=;
        b=ibk4WNEVIq9TfVpPmOuC2m/81azSFNBbxU+ip/xSt/c+TDqLWM7VH8Vlgr4Vh2jSQL
         i6VJarObAR+IwId+QOa1WK17bAENMZIN/ZOLo+Bsw2h1bC60VW05U32tl/+GbO6EwaBD
         IRbAyApARJiSJ9PMcOEtdHodBzyFWeNjMqXjwO1Sk9KpsMF25SYs2uhTak4I/7e27A+t
         ZgVvA3obJZniMjZvGtyzg3e8xkps7NwSvfbe7xZ53nKOxIREJxMtvsfL/1pNM/SOi1Tf
         iD3U8HDGSkxkDZu94E3NcLTGr/3g7aPldfwhwD0qXaRum0L2fCQIQd9jpB/51uBpe8QL
         3CrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723149232; x=1723754032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seHn3hgu6UTSmqAcAi0Wir9GGPHWi4I0PsaQ9xlGd/c=;
        b=ed19fiMel0CwKzrIPfZH69U8jE8+CaPAls8xBt0luDmTAhROFo3xuZ2Nwh2UVho3oS
         khtnjmTi8keBrtELkGmQ1gR+9d2VPR8ZEQJXrHqYGZWx8hd/+X44S0c1hPPQJ3/ipslB
         iZmzsc7OCupkQzOn+sUDcsPE+UR1HWJUdCfsGUwphN242ycEqh7Oa23zMCYsn1LxjXuU
         F8pfeIzh3Dizp6GRK5qvUrS2ehmzpyFgaD/QzTwACDifLA76B801tI3t3d/Pv2dlcBTd
         XXLrunCe6nWRkqe7AsYZTwsRw5yGO3ggl/d7pshV4RzhAEdC0tpFsu1HgEKUXzYfFoar
         MoIA==
X-Forwarded-Encrypted: i=1; AJvYcCU7aSW4mmOR74rdmQztObcN6FHD931pD14tq6kK3K3c8lecBZdyHFG26PYMkZ1gTuo98NMepBPMzGtXIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9iQWyo6BvXfIZv2eQYoa9LTS0f1UlMjsXIs+hHklFeV/KV1UJ
	69Jioc523FVvyAGC9s+EMesIFpjEdZe4uWfOLkFwylu2Ds3E3rnMnvFQVMEz3qLvAO63FKrvJ8I
	qnTdEby2plq/NKel0OVFFxfhQd/o=
X-Google-Smtp-Source: AGHT+IGsBszfKr9JqD4wS7duIAR+f3h3U7fHKLAoPc9XS93h9UfOxb6I5PP0r8b/xfJXPC9fF6d9g9ie1sR866lDYmM=
X-Received: by 2002:a05:6902:1604:b0:e0b:ea37:9c36 with SMTP id
 3f1490d57ef6-e0e9dabdd28mr4306844276.18.1723149232259; Thu, 08 Aug 2024
 13:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808172948.303258-1-benjamin@sipsolutions.net>
In-Reply-To: <20240808172948.303258-1-benjamin@sipsolutions.net>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Thu, 8 Aug 2024 21:33:41 +0100
Message-ID: <CAP-bSRZTa-AM=aPvoTW0Df2qQaTD8O7LgSLmZGZtEe7fVXigMQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: iwlwifi: correctly lookup DMA address in SG table
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, benjamin.berg@intel.com, 
	miriam.rachel.korenblit@intel.com, regressions@lists.linux.dev, 
	johannes@sipsolutions.net, Kalle Valo <kvalo@kernel.org>, 
	Ben Greear <greearb@candelatech.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2024 at 18:32, Benjamin Berg <benjamin@sipsolutions.net> wrote:
> [...]

Works for me.

Tested-by: Chris Bainbridge <chris.bainbridge@gmail.com>
