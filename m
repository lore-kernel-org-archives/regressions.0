Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A56617995
	for <regressions@lists.linux.dev>; Fri,  5 Jul 2024 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720160338; cv=none; b=COLMKeDIfuOTO1SKQZTbTOqefjetyk0UXHgM5avj/m3N4V6dhZ5AcMh3uJKGlBF1q1ecy5CTe5a7WKez0n0eGRLX5gLaD1vuiP3ETHxOFPKXjhQ3D2igiIhT3xP7TK+fDD2amPhtHWLU3yhXyxrmCVwFwYScviYfmAkdDjj9RMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720160338; c=relaxed/simple;
	bh=rEC7/EfU+RskXymDz781fmR1JStN/Y2YQhHYC6swu+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUF8muAK1qstrAuAn05pOreUyZNGgCakDkvJyqinTogtqeJPO2jmH7ZBQgNx8w55FI0ekmqyAsCHAzGkogpmakR6WpYcWe6vwtya17zEFBxfbz19hC4iAWgQwK4nFvtazbPbFlaMytr7qgg0SP6Mm1PKlYrFWyNjDcVtT38KE3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwAmoiaD; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwAmoiaD"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-64b417e1511so12124847b3.3
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 23:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720160336; x=1720765136; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rEC7/EfU+RskXymDz781fmR1JStN/Y2YQhHYC6swu+4=;
        b=BwAmoiaD0KvlqGR3CJz43T5v3ah5Aigaozlk7Z4QShoQzz1RTbP41/KOybOMowAdqI
         Sdp2yXnlbpyttNS9TeZREqY2egWSDEeu6Xne2v7QLFl4obL+fpAwFKi4zhsLiJIzfRC4
         tqqgUl+h/KL7XTdJKw1QmE/ROvNbKP/Qi9yTFhgpQFD2wyZFUCfTjwkbfRXTXOfkPlfk
         qBwzmarWDexZfvKk4fi9m3209cZlO6YtnpWtaMjpWh7Y0B8N8OI2qByz0Hke33pgh38a
         BSMYNUVaZCPmIZNUUrPKK6zf73NcgaKadLAVT/GRb5Drmn4hsgnjDdr31+/Fz9uj/FkB
         MrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720160336; x=1720765136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEC7/EfU+RskXymDz781fmR1JStN/Y2YQhHYC6swu+4=;
        b=LVgX4rCkjPmcrgeku5ppLc3v2uXQaxvcd/XNC+Dcw2h+w0v3xyzQSEjmQhlC5b+GRn
         Hq6TZOTzAk7UC7csXDd2TMS+jgpOh916H/vO4RL5h8GWw/RvX6MD8pi72Alc2guf30D/
         0xj7r+Ttq1BnyUfdGBG3aRKY1ZHNnhjJTGic4sWWGT+miPdIBLM34Xbv7VjeOkBObU+j
         P2W3eoH7L9cHEAZn7LGNYl0PEFhaZXkGss+d5BLZb8c61o/+CUETeifPTcx9blrLIfTP
         b/SYnJ3ECiE4sdU1kJ71JE5tIwSDpWbC3cui5ST3EXl5tsZm6D/36Mglvtes8mS0ThVr
         H4ow==
X-Forwarded-Encrypted: i=1; AJvYcCXDE5hNpD9wIYIOdbX7ZLDj1tGEzENI9JdDDlxcn8tmArSp3ziW1vnc8gPfbJq8opNfShgt4MfEcJuVRGKv3kMkDPJYNrjUsvVt8Mk=
X-Gm-Message-State: AOJu0YzEbz5k/PKyFB1bfMFA1P2vvsHhTlO39nlfQgy/V/MOjwsaeUho
	JfRVhtOYoAKLQGue7bhOZWO49u1EImK2H0JHuD1IiEegT7d9OJOyd8BpJjoWh5mtLpBQxPLEnUx
	7S9oXkfVcLNEAy1pcgXos+GknFqA=
X-Google-Smtp-Source: AGHT+IHdXrZVDzTWxHaN8cS/1STMHlHytdAWYoBRFLgeI+cxXO6RYGaMCDQ3SaHKeBbh76/jIajHq3wRoqMqamPesX8=
X-Received: by 2002:a81:ad17:0:b0:630:fe1d:99cc with SMTP id
 00721157ae682-652d8536b22mr33191517b3.52.1720160336516; Thu, 04 Jul 2024
 23:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
 <CAK-xaQagqS0kePozkim7sB_Zi+8NrDRnbqFuLVQ3s4F+0WZ+DQ@mail.gmail.com>
 <CAL3q7H5AFbSy0JC=u_MAfNR-J_kFQkaG6_pXJimD80tchFXytg@mail.gmail.com> <0246e506-db8b-47a8-94f0-943e7be92dcc@gmx.com>
In-Reply-To: <0246e506-db8b-47a8-94f0-943e7be92dcc@gmx.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Fri, 5 Jul 2024 08:18:39 +0200
Message-ID: <CAK-xaQY5i0_SN94oEQQ+qsJgT5Uym-qa8eP+=G3S=je_+YotUg@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Filipe Manana <fdmanana@kernel.org>, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com, Qu Wenruo <wqu@suse.com>
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 5 lug 2024 alle ore 00:32 Qu Wenruo
<quwenruo.btrfs@gmx.com> ha scritto:
> I think it's a little overkilled for image dump, would fix it soon.

Thanks a lot Qu! You are always fast and smart!
