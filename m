Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF4D2F3A
	for <regressions@lists.linux.dev>; Tue,  5 Apr 2022 14:23:28 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-ddfa38f1c1so14509184fac.11
        for <regressions@lists.linux.dev>; Tue, 05 Apr 2022 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3viWxA/JBHdP0TQbOykdsaxa+Gs7txej/lLx0GIvIYg=;
        b=G9QnFQmPtVjj4tVobX1LMic5zPY274r2vdLPAoUHBKEo99rnSV8OgrXJiFUo/7/jTF
         HjRanar2kAcinOYdoYvDGcnYJCuDuEuq0Zai+Uq0v6oNYRccBrMVRMdFmiEV85NERQ9C
         7vO48nBrMzEKZEJVJ8XZajlPZLIjcsxvASt5VlRRUCL1kA3K18vbkH8swg9+yzJ9rGMP
         bFCRoCQAY3/a8STCLM+PzA5oegHvKvG3gC1g6iDc6bi30ZQD9wkIiGfKM1QRvaqcYdSM
         rfBcCGGpw/3xxa0Vz8+ryEQQNncgOdCH6noH47HWTgOvqSb3hQ57Qsfk/RiWmJ24PVYC
         lHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3viWxA/JBHdP0TQbOykdsaxa+Gs7txej/lLx0GIvIYg=;
        b=CrzDpVAJjkN1QGDr4SaNNJe8h8L/RW17pLvGqdXBz73o22Arq8I6ACwdX1Zaxx+2NO
         /eq1YUoi1QKYpM93tt+Knw5J+Hl7cScRNlCAa8S9nKrPdrsDJa5FdivmKy2AjFIASq4w
         b4SejSzREHtW81NyWEZbIk4uXtUDXBzSfR7Ej7b+OaHbFnu30N364C9LjqGOc3u5zGlk
         EQvDnyiTJSaVKaX8CRSDyL85jaQmfeFXuKiAgsqAMOjt6Z8vIZFjRW7ApJ/djVN90hKS
         FBlo631UNKZTMY0afwhRxbyCCMve0bLB5MssF3AoSctt2wfQV6z87pFouRhYSxOdzSWv
         272g==
X-Gm-Message-State: AOAM530l2cGdbOE6neKlnmcJGgo1EV0McK0intRn7QixNuzXHQRJn3iQ
	fRh4I18zA80gVh74wxIB6UAEh72GJ92SU4sccDI=
X-Google-Smtp-Source: ABdhPJwwvFJ/nErrBLzLGpycHCVzIhCmGoPUp6o1bgcidxfVOxHS2sTwvSWskrCQURlhd5hQ2zrWnsbBLhhhsqySV8U=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr1567641oaa.200.1649168608008; Tue, 05
 Apr 2022 07:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220403132322.51c90903@darkstar.example.org> <CADnq5_M+M_iykM0Ag6RF+kxzgpEopUBtp82h7tRM3G+B3AWZ2w@mail.gmail.com>
 <20220404213940.09a56d15@darkstar.example.org>
In-Reply-To: <20220404213940.09a56d15@darkstar.example.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Apr 2022 10:23:16 -0400
Message-ID: <CADnq5_PhaFbVCb=-AUCx4L-sCyPCPOsY3tNpiAg=gfCN7hFcJA@mail.gmail.com>
Subject: Re: AMDGPU: regression on 5.17.1
To: Michele Ballabio <ballabio.m@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 4, 2022 at 3:39 PM Michele Ballabio <ballabio.m@gmail.com> wrote:
>
> On Mon, 4 Apr 2022 13:03:41 -0400
> Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Sun, Apr 3, 2022 at 10:19 AM Michele Ballabio
> > <ballabio.m@gmail.com> wrote:
> > >
> > > Hi,
> > >         I've hit a regression on 5.17.1 (haven't tested 5.17.0, but
> > > 5.16-stable didn't have this problem).
> > >
> > > The machine is a Ryzen 5 1600 with AMD graphics (RX 560).
> > >
> > > The regression I hit seems to trigger when the machine is left
> > > idle at boot (I don't boot straight to X, I boot to a tty, login
> > > and then start X). The machine after a while blanks the screen.
> > > Usually, the screen unblanks as the keyboard is hit or the mouse
> > > moves, but with kernel 5.17.1 the screen does not wake up. The
> > > machine seems to run mostly fine: I can login from ssh, but I
> > > cannot reboot or halt it: a sysrq sequence is needed for that. Note
> > > that if the screen goes blank under X, it wakes up fine.
> > >
> > > Below a dmesg and two traces from syslog (they're quite similar).
> >
> > Can you bisect?  Does setting amdgpu.runpm=0 help?
>
> I can try to bisect, should I narrow the search to drivers/gpu/drm/ ?

I would just do a full bisect if possible in case the change happens
to be outside of drm.

>
> Setting amdgpu.runpm=0 works, the display now unblanks without problems.

Thanks,

Alex


>
> Thanks,
>     Michele Ballabio
