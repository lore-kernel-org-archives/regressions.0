Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A674C7B
	for <regressions@lists.linux.dev>; Wed, 25 Jan 2023 15:48:15 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h12so13500598wrv.10
        for <regressions@lists.linux.dev>; Wed, 25 Jan 2023 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WbCVpTXmOt3PhuSkGfAaSb6Dc7YjW0ejwuYxgg/UJZI=;
        b=ZGdpm7DnRcZ3w9rAbIMDbQqVY1h2w3oIxm/RvoN70Z7xe/U/IOmYBn5szrL+W2ZNRk
         dLO2gC3StADv4KcaY3D8a9RQ9TuQtUnQX7HzCUCv6VjSt3Joe9t0SqPIKoKYG22+4bIP
         uq+ix2/15Wb5gKx92av3LSU5cAcrdoeAr4rsxMtPO/uT7gcJj0U1z87sNseW1GnLNg9+
         uaeIvzuVMqdqCbEmn2db5izIFPe/+iS1OTU9IWOhKqICpbYYmaACJvwJx1lNgmwIR30b
         ODyBct3d7c1bQ78+DMwc+SHf1rGgbLrrbgSkMcLwEP1ewj4CNBYcQGAauxRCaUINLf2h
         GpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbCVpTXmOt3PhuSkGfAaSb6Dc7YjW0ejwuYxgg/UJZI=;
        b=bVvNfqHqF8002FYkgkMfzyd5x47f6Y04bacbbJ2JQmUjwGQ4SAwSPnU1CKFEPTkrkR
         QXM7Sk30746wPOex3TdW7Y2hOFAXdLOuhe9RQ5MT0PZx7mWHkPSrZJwYes/PDcouO9EO
         01/URrkbsSXxnuyUw5kz9yaV3FccUCJBlCO1JKEiNQvoxKNccdndJFKax5cZlljy5yoo
         uEIQiudCmOWxzU4ZLB1GVT7LGtU/jpVQlzcWuXWgyeaRsBZWDYjBf/R3s/e3e/vetpS4
         tM+fpig9oUQz35/sEm2e1XUkekMy6FyyMc8dqZGv/Ojq4YCPuAJvocyebA3Pz92RRrLj
         IQuQ==
X-Gm-Message-State: AFqh2krvpFAICYKlm6+l/XBEJQEQsoneeN8AVVd4jOasJXAjxP3HN4ol
	q9qLUjw8l4toTytqkfRLY6zba0udxuMuXdaCVCrgOYRAzQOz3A==
X-Google-Smtp-Source: AMrXdXtXuK+bRyEFGXrD3dVKMM6j4zF7uG65dRSc/QVHP/dcTTRDNFaAINVuyNEbnglB5Ed8Hb6G2xPPjw4w0t21ez8=
X-Received: by 2002:adf:d229:0:b0:2bd:f5a5:5898 with SMTP id
 k9-20020adfd229000000b002bdf5a55898mr852248wrh.319.1674661693524; Wed, 25 Jan
 2023 07:48:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
 <Y89n98fRfTpLmPUg@kroah.com> <CAFJ_xbqMx8LsD_Ry70jnqVmmhyGjTFpA-Gv7SpRR21v3Djr1DA@mail.gmail.com>
 <CALFERdxxAt5+Y0nxbEieYSZX8YLTA9aogtGWLLZBEpGdbWxT-g@mail.gmail.com>
 <CAFJ_xbrAVZDtXwe0Ku0V7b1xp580N+ao0caCRP1xiHBr11oKyQ@mail.gmail.com>
 <CALFERdwpbQdpnyLuHxo67S4KC=if97AzLGDRVEo+u-HN2Tu0fg@mail.gmail.com> <CALFERdwXwJxZ=jG=p6J1LUERzL9=xaiixN1t4Ux11axMW3CJuw@mail.gmail.com>
In-Reply-To: <CALFERdwXwJxZ=jG=p6J1LUERzL9=xaiixN1t4Ux11axMW3CJuw@mail.gmail.com>
From: Lukasz Majczak <lma@semihalf.com>
Date: Wed, 25 Jan 2023 16:48:02 +0100
Message-ID: <CAFJ_xbpsWVaRHxS_Q=5A1fTxzh_xuBd66garxX63WqEkiXieFw@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Sasa Ostrouska <casaxa@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

> Hi Lukasz, please see the dmesg with the non working sound kernel:
> https://gist.github.com/saxa/08b233a95d5e52046354b07d2e9ca13d
>
> > Rgds
> > Sasa
> > >
Thank you Sasa - two more things:
1) can you also share kernel configs (for both cases)
2) what procedure did you use to flash Fededora to Eve?

Best regards,
Lukasz
