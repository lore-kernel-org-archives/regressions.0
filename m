Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34510F9
	for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 11:30:59 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id p185so13013379oif.2
        for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 03:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=II4zNasgw0R1ombwNR2uePK5F3R1YPSv70GN5NEjLrg=;
        b=VQPxzRImD8bdkz2cq91DikhlyYNDJWu6/B+4KbrkyoKDyZn71TshvS+EOAfEDaBcTv
         F1YjRL7D/C/cRdlqm9v7MganVAJeX/FG4XzqN6RHkUf/wInyAaT1VsTu6aOlZyRjC8BC
         sV/E/nZn2KYgdmGwCnIi8rjRvXmp4Or3TzzSXb5topKrb0cKYUwaflIgJMxLqE2isDKo
         DK0bxzmJJ2vv8jhndgtcmOu8Jxy3C3k/NNYAOKVariHk7oasG56/PMTu+SsFxGKfqwko
         eN60mwl6GmnUQK9lSdzguuXGXLhetaeIdJJ6nFIHUVgUty7uRGyAwzjQk2T+Q7XnNMIh
         aV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=II4zNasgw0R1ombwNR2uePK5F3R1YPSv70GN5NEjLrg=;
        b=lPKKe5Qe068+j4LwQR4AgpRpmiXJ8w5m9fIZ35E0kzSQeiuIgpcEj+TAu5R7Vw1yZy
         UQgWgHyZFqnnjd1LkG5uAY46WZTk/+44bErHfQujxZiWx1BdGWtr8rwqYppaXxd/N+xN
         G1JzH7XRRSqpcviK5eqavqdGn4zpIJJnjKjlhTRO/MHQveJ/FwHo/DJ+TPNp5pITRari
         xKNqz/5Psi6Fiv8MtEaofnO2g4iJT/GRu0OCTlXke2NwgsMJ1A0P/VMsSlSx49k5GnBl
         iLC2Oifez/6vMb6u1camxwgJCELQfnhmsAecW/8kgvMTlfbppHTaWDdLLtc47R8r5Pza
         odTA==
X-Gm-Message-State: AO0yUKW21XsIh3YrMYTtSra8+IXgsv+4LOuUhZOCtHomX0WcBmHXOplq
	8RBz3MvbpMmfk0zG23Ng0h7xUh18GZyPYzsJfOc=
X-Google-Smtp-Source: AK7set8RxHFDDCQHln2EJIyxCCUHpFR4FSps1AQUKKWMU2u36GHP8U4cbwuLmv0UKvE8kdVA2VN6dY6gSs+jW1C/AmA=
X-Received: by 2002:a05:6808:2124:b0:36f:18f:cdfb with SMTP id
 r36-20020a056808212400b0036f018fcdfbmr74160oiw.270.1674559858506; Tue, 24 Jan
 2023 03:30:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
 <Y89n98fRfTpLmPUg@kroah.com>
In-Reply-To: <Y89n98fRfTpLmPUg@kroah.com>
From: Sasa Ostrouska <casaxa@gmail.com>
Date: Tue, 24 Jan 2023 12:30:47 +0100
Message-ID: <CALFERdyp9YoMLVtkE_HdhY1fSvLh=xm-RxDw-cFAXbrPkUBGMg@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Lukasz Majczak <lma@semihalf.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 6:09 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jan 23, 2023 at 09:44:34PM +0100, Sasa Ostrouska wrote:
> > Hi all, sorry if I put somebody in CC who is not the correct one. I
> > have a google pixelbook and using it with Fedora 37.
> > The last few kernels supplied by fedora 37, 6.1.6, 6.1.7 but also some
> > earlier have no working sound.
> > I see the last kernel for me with working sound is 6.0.18.
> > On my pixelbook this is showing in dmesg:
>
> Any chance you can use 'git bisect' to track down the offending commit?
>
Hi Greg, I never did that in my life, but I can try if you can point
me to some documentation so I can
try to put that together. I know plain git simple stuff like commit, diff etc...

Sasa

> thanks,
>
> greg k-h
