Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85538DC40
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429998; cv=none; b=ra54P52Qi7SAI9FBag6YNaaUXfO3M+aRrArgjaDpqtBHTeUftzdPl1BzuSnt50QBleIU7QdUjgaS6fmbJjUTHJ+aPQLngZ+k9IaX3iI0DRwGdAG9epVnnFJzLespNb/p860y+D1FNfo44+50Rt/FzW3/sxf8wHxQDRkCRFZyn6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429998; c=relaxed/simple;
	bh=ez/ftBKUFZXPMBA1j+BIjM+rYkY7cSycREcI8v/26vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBNdCcPaJZLfG5tj32tKlbdG0LnUyNdjUkkpbZx4voFJ+/zvVQaDrDuxOJkFU5lMtIbQjH0U2nYfHHZDe9uomj4ZNwDDMhRG1b8+2asJqShfw6IFMaBxEQT3mZCpk6Z9wyNdEUQ4LZWLLkMM/2nwyEPG/rCOy5Ib9/ZU9Vzt/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CShf6cax; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CShf6cax"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1712a04ddaso389385166b.2
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785429995; x=1786034795; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZlOLGFSy/CTNPahqtj7kyVyKyd2w+qb5becmlDJdco=;
        b=CShf6caxtITmJ2tC/xeHnYZUu00wZauf44myxHZdqqxekJag4WwTdSLUJxrupc5Gh4
         rTE9eBkq8fQjTkiVJ850uChXgyppJU00ObIWJ8W3wN2ZzFxH6sjYhgJYGcnBLS57dM1c
         bwrqeUwU5BlaqmSdF13gW4tCyaJ3nE/A544hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429995; x=1786034795;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dZlOLGFSy/CTNPahqtj7kyVyKyd2w+qb5becmlDJdco=;
        b=QX2PsugEzmdZjs7Fz7oTLeju00k5tden70gQ8ZBDu5IOyM0laJr8i1xIv32pDn5QoQ
         RRte+kgXD/kQVE1P2l6nQQADBamMQo9bFyRoT70OZN9dtLtpSRz3QcqwO4FQoReEw8SL
         zcNin3jpKwUSxF6MLC0kqKx0k/lU+No6RbyWQDP1+rybkTCB5R5mHWcKDjSKnU2lvy5i
         9FY6sSXk9fH8F7OwVrInX/NfVD8NbggpopWbtaraCc4LNDygm+AswRrg9SxtavQcfJIR
         womXFzC3vFnYozRHwxWbP142ma/yqh0RhkqmoT2d4UGFy11oKAbkOU+Fr9l8TMVgWR95
         XfWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkQ0E3Z1SDgXXgTlchNqS0uqd+Cm3iOGo/CAX/XzIu+5S6wTSfmSbjpEUi/Cdo3VEY0drsmAegK0sUgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdBGIYLI/6CyXpnKJWBhLmTykZCJcjGmW2jfNJNQEs6NJEGNVi
	jJW/7scABmfYXllbBj4ya7eqAeMGo21dXzDqSkNQwpdbD9IA3sbkB4T1joWhfN6K7fj7GO6LDtA
	HXwtQgOU=
X-Gm-Gg: AR+sD10dyJFLHjxgkyLaueC5WfVaZHvTo8JTsA87JrpyMjYm20qOcDMIP/AErhAFhmB
	cZA4Xvh1VlGxRrXycDywU68OXlFcup66RgiaKXNmK3WLq+rFq+VTWIAttsINGuNAX0XX7g9Guak
	s33rV6H1ILLFFhQ1f2DqWMkC7hako+UL5Bk5y6lTDPnMTa1xQucpVlf8rTQp2jX9nmrHuu2ubCc
	Q9ph0uZs594KGqxvxN2WSOv8hQZgCeHc4Bf+EENqqH9R8MOqSDrH94f/dxc8z+rnGGdIG+FF6dZ
	ADO84Ac6afEoIL8b6ghDaHm4TP6w28VHGHiDcE5+d2cCVYJ6MKu5wRzfmz/D7n0yM/4gPGgPtOy
	tnuWXkg2xJlyMfS5bOhoAWqg+Ts3T98Si4gsBgSS9QfmZ1eZuwKB2O/c4xFmUSaoVT27CT3tBni
	bJxE8QoOLzRSwcwSdLuuPbwp8jqWCpJizm8ZkIgCGZdEx2TMQE0X4O0/XuMH7B7BvVx6JdgVe54
	COyuGOtD4OkQ5F1VNEXzuySyZlWjT+0E4MSGw==
X-Received: by 2002:a17:907:d08:b0:c16:7c0:21f6 with SMTP id a640c23a62f3a-c1fa56ff703mr158477966b.38.1785429995132;
        Thu, 30 Jul 2026 09:46:35 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6dd7sm94330066b.52.2026.07.30.09.46.33
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:46:34 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1671ec8692so298356966b.0
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 09:46:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoVpONAvablU0bZbfvE4b4NlHLznIEs/kX0msH2jDIZeDgxK2TOPsyXb/Oh9BhLo47M6jAUM0YbII/EAQ==@lists.linux.dev
X-Received: by 2002:a17:907:c17:b0:c1f:1267:deb7 with SMTP id
 a640c23a62f3a-c1fa57ad4d6mr193696066b.62.1785429993415; Thu, 30 Jul 2026
 09:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720201057.1862857-1-kbusch@meta.com> <ampRQyXDbGgeg49V@kbusch-mbp>
 <fbe9e74d-c389-46f4-9874-3e9ffd9c91d3@kernel.dk> <ampce7mxSmxAwAiu@kbusch-mbp>
 <20260730112626.GA24827@lst.de> <00104e90-48b8-4419-90c4-ac0c4a2e1c44@leemhuis.info>
 <bd7249ff-d0a6-4a3b-8aec-3b5325f24b08@kernel.dk>
In-Reply-To: <bd7249ff-d0a6-4a3b-8aec-3b5325f24b08@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jul 2026 09:46:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiDsWYL2c_vpqArX+UL9k8v3qoge7HqjtcrxbVsLAjfXw@mail.gmail.com>
X-Gm-Features: AUfX_mzqOY3ca4Dui_O7sukC5vCEWaDgT57cEJGjc9a8_XBsD7VAxqL5ujTpsZc
Message-ID: <CAHk-=wiDsWYL2c_vpqArX+UL9k8v3qoge7HqjtcrxbVsLAjfXw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/5] block: validate direct I/O memory alignment
To: Jens Axboe <axboe@kernel.dk>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Christoph Hellwig <hch@lst.de>, 
	Keith Busch <kbusch@kernel.org>, Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, dm-devel@lists.linux.dev, brauner@kernel.org, 
	djwong@kernel.org, viro@zeniv.linux.org.uk, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 at 09:23, Jens Axboe <axboe@kernel.dk> wrote:
>
> Sorry that's nonsense, because how is Linus going to make that call if
> we can't.

There's not a big enough thumbs up emoji in the whole universe for this.

          Linus
