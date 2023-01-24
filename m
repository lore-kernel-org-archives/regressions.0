Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB363DF
	for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 14:31:21 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id r132so13406287oif.10
        for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 06:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8aIBjSXUfpYCdPRZCAqFHfonN341BvCufsa1ALucXT4=;
        b=diKKU4qNqun4yyyiEF/WTOZZxoDHmlcP91UYxpf4Yzc4fIyoG1PMt/f6EGUn/TpATr
         yX/p1MLRZpwYNJGNRsb1iJXaXjtuEESCwBagQqBqzkwWjSIhn1SRpweC+iePXKhdvsPV
         6QtzwkbHLCe1+6Xf1GUgPbQLGLtXZ49OinfDfpwWs1ubb7Wd367HswbxtKxDdws71VCo
         A8660rEu1OvSfjWwJQMo9pct8uRpIgRai8qw5qN1sDpmS9T608vD8aT16+DWrtsJoTdy
         I77kG4xTS2QJs1vop2KRr6EdrlCSunlqccJRSNK0PEYUUnye+EW5GQF6ImGSONmk8VsE
         ymrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aIBjSXUfpYCdPRZCAqFHfonN341BvCufsa1ALucXT4=;
        b=VGmUIu/+qevVzbo0GdD/t29pmouV8EGfztuGvn/3F3zv3cXctQwWg1VLRkuFwz8qhC
         SPwGfuRH1YhW5DyKCW7vYgYn+C16hzoCY1eys2M1JoQtLMwh8LEU1f1qxofx6wSDBfec
         rrXbalLPLsdVGO36KI0GIDGEQWAwZ7f9DY+sOIyzqOrDILPpuId2TVfl/4lhEgNGvlrH
         ecyOcJ2fd7l4IfpPvR/BUj9Q9HJONnbcxDpNG8JwtjiE4Mxtm0aulaPDS3E4Qo8y9cx/
         mRk7FYYrcjw4nHBK+cn7Vv8f/0ceVwgDt+TH2Yw3klhunR3IauOPHF+1cGuyNNGt5ifK
         i6zg==
X-Gm-Message-State: AFqh2krGG17bom25Ksmb0uXSw6ej8wF+RLOhvCOtk4nsfSzGWyK9NG6q
	/GEeID77ga5vvSHqaP+GFtCyXilVFpxV3gv8AvA=
X-Google-Smtp-Source: AMrXdXtSqXT4h0olGTZ895AIXRb5yq00BRJP7OfVu5gTPWUGSwcpAlbcRtpJ9syrnsIl4U0Fnzw+mizMT3fe13l5vBE=
X-Received: by 2002:aca:ac12:0:b0:364:a686:4444 with SMTP id
 v18-20020acaac12000000b00364a6864444mr2103482oie.298.1674570680763; Tue, 24
 Jan 2023 06:31:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
 <Y89n98fRfTpLmPUg@kroah.com> <CAFJ_xbqMx8LsD_Ry70jnqVmmhyGjTFpA-Gv7SpRR21v3Djr1DA@mail.gmail.com>
 <CALFERdxxAt5+Y0nxbEieYSZX8YLTA9aogtGWLLZBEpGdbWxT-g@mail.gmail.com> <CAFJ_xbrAVZDtXwe0Ku0V7b1xp580N+ao0caCRP1xiHBr11oKyQ@mail.gmail.com>
In-Reply-To: <CAFJ_xbrAVZDtXwe0Ku0V7b1xp580N+ao0caCRP1xiHBr11oKyQ@mail.gmail.com>
From: Sasa Ostrouska <casaxa@gmail.com>
Date: Tue, 24 Jan 2023 15:31:08 +0100
Message-ID: <CALFERdwpbQdpnyLuHxo67S4KC=if97AzLGDRVEo+u-HN2Tu0fg@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Lukasz Majczak <lma@semihalf.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 1:11 PM Lukasz Majczak <lma@semihalf.com> wrote:
>
> > If you need anything else just let me know.
> >
> > Thanks
> > Sasa
>
> Sasa,
>
> Thank you for sharing logs from the working version - could you also
> provide dmesg for the no sound scenario? You can also share them using
> e.g. https://gist.github.com/ .

Lukasz thanks, sure, will provide that too but let me reboot into the
non working kernel.
Will post it on gist.github.com and post the link here.

Rgds
Sasa
>
> Best regards,
> Lukasz
