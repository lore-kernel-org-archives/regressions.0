Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0685745025
	for <regressions@lists.linux.dev>; Sun, 20 Oct 2024 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729459535; cv=none; b=DmHgYpx7tfISV0U0iInNfehjKnPbor4TctGKF+Uhwpo3xtuFa0Ug0cIjvYyNZBT+zCD1VtN0Rbu/+FYTjPl9xn1c6oqGr/RE+Ini7mt+B+MRwurPQ6y1fLkJVWIEi5lqbECqYqIXa4dMhKtcYnNWqh87IrG5HbUp/zSrC5KTD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729459535; c=relaxed/simple;
	bh=XkJsm+YQn9dFOqvyQtmGu4r1jDNh0/lklKP+6iMRiwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+G2+De8JQb1fdgnZ2eme4caReNFkWLpio9Snult9b5/isIiwXwzHD0MEx8h5gwhpq6kknHKWwjMFdstkv2GYRYBSUW+H9MQl3n2ldQv1oD5wtGq9ZJcNM7y8WSyh19BPviHlqgSX/uKBFZUL871122wOVVI9E7FkDBXM6JQ1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VNco+80H; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VNco+80H"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f2b95775so4416815e87.1
        for <regressions@lists.linux.dev>; Sun, 20 Oct 2024 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729459531; x=1730064331; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=86Vxu3y5hRyjW/SN4fiNS5sxS0hzqrFNGJyjGIFIOpg=;
        b=VNco+80HAmBo9o1dEcLUjW8tbDh0tAmmVdUoKnjSS/L6TBWRCXjq6nqckf6su352pT
         S0890FBffwyNqUvif+zq8A1YcrsJL0pw0pMTRZcoTWFNEAACy9p7RWUjXwuUaYC9kyg0
         GUt7Bp+mL26+Vr5O2SLtFynMfRuXq7oOaYsQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729459531; x=1730064331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86Vxu3y5hRyjW/SN4fiNS5sxS0hzqrFNGJyjGIFIOpg=;
        b=iV/A3h5AoKHyiFqFj5TtAM9hqiWlL61LG7/E/cOXP/oWBrbpFCrplz6cVhkGdVmtp1
         7Od5OwRcVX0+tRiwC1I2r4vPIHM0zM+UkzZTLe/lAF2ir2SfghTlzV6aedKcsXoL8Ixd
         fX7YhB/HpRyhnDX/61LjBb8V1YMLU3ClL3Hf8BOqVyQu/Vit7nkwCyKhg0yba52H6u1m
         o8qG5+UppVVqZtVEvYkwJTL81YLfWzjNhBxzlQxYsWr8YsqtKFc07vF0h3kYimjMdXYX
         Rx13OXwY0zBSbUTOqb2Neu/TiYhV6bKGPlRlth9M9B+wUrhTPc7pNFs9mMwRn0n6Kr9h
         7bdA==
X-Forwarded-Encrypted: i=1; AJvYcCWoNELdMN09kwRh4pJ/oRE6ES44epl9M1GZlNkGacXE/CvQagUxGSS/VA32WLhj81wj4b3pc1pqQi8/Ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YwH82EDSZgkdOFP9vImv/44uMAHlC7dDu7onXu8YP71P+5FojgP
	HWOzUD5xAVUkNPx7YSHId1/BidxR9bEG8gyT4q8NCuDoXPKmGLN213eyk/9KLYnO9Phz0d33dWm
	iRQHm5w==
X-Google-Smtp-Source: AGHT+IHJKcsk00cDj0KALV1Wjj0mKdgThw4bgJJ7LddfMOrrwoWuNAVUvK9MrR2Du4oBoi4NwZ8Hcw==
X-Received: by 2002:a05:6512:1292:b0:536:741a:6bc5 with SMTP id 2adb3069b0e04-53a1534083fmr8093444e87.12.1729459530594;
        Sun, 20 Oct 2024 14:25:30 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2243ec80sm312706e87.252.2024.10.20.14.25.29
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 14:25:30 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso58049831fa.3
        for <regressions@lists.linux.dev>; Sun, 20 Oct 2024 14:25:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBVoe79/vm2GXo4PLfH+aDXDIFnNVkM383sH3WU2RN7GRSEFs+cJ/mzvS8doBbzezYExJ7WHtByW4Zxg==@lists.linux.dev
X-Received: by 2002:a2e:8815:0:b0:2fb:3881:35d5 with SMTP id
 38308e7fff4ca-2fb831efa0dmr47530391fa.35.1729459528880; Sun, 20 Oct 2024
 14:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016204258.821965-1-luiz.dentz@gmail.com> <4e1977ca-6166-4891-965e-34a6f319035f@leemhuis.info>
 <CABBYNZL0_j4EDWzDS=kXc1Vy0D6ToU+oYnP_uBWTKoXbEagHhw@mail.gmail.com>
In-Reply-To: <CABBYNZL0_j4EDWzDS=kXc1Vy0D6ToU+oYnP_uBWTKoXbEagHhw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Oct 2024 14:25:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3rQ+w0NKw62PM37oe6yFVFxY1DrW-SDkvXqOBAGGmCA@mail.gmail.com>
Message-ID: <CAHk-=wh3rQ+w0NKw62PM37oe6yFVFxY1DrW-SDkvXqOBAGGmCA@mail.gmail.com>
Subject: Re: pull request: bluetooth 2024-10-16
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, davem@davemloft.net, kuba@kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Oct 2024 at 09:45, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> I really would like to send the PR sooner but being on the path of
> hurricane milton made things more complicated, anyway I think the most
> important ones are the regression fixes:
>
>       Bluetooth: btusb: Fix not being able to reconnect after suspend
>       Bluetooth: btusb: Fix regression with fake CSR controllers 0a12:0001

I cherry-picked just those, but then I ended up looking at the rest
just to see if duplicating the commits was worth it.

And that just made me go "nope", and I undid my cherry-picks and
instead just pulled the whole thing.

The rest of the fixes looked too trivial to be worth me having created
a separate cherry-picked "just the most critical regression fixes"
bt-fixes branch.

IOW: I've pulled the bluetooth fixes branch directly, but sincerely
hope this won't become a pattern.

           Linus
