Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99206AAE
	for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 19:39:53 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id j8so20789940ejx.9
        for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 12:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=eXUe1BR8Hzx0AlRA4j5CpVPQMTfvDQtF6ML2yHdSAeY=;
        b=rMOmYOZth9TGM6U9CFCVe2uEHgHLhSuKgacv0A6uzAojEQ4P/bQ8XDpipAheGmbVMq
         iVgttWfO8wGiEAZH/VfCvqW5m6RqZ96PdhdVMRgtCd3U4doFDcJ6e3BpHq7mSE2AYtEB
         1ogpT76XO0Ed+zAjOtIYinnooim4uhUJKE1Q7+Weh3VnYgyvosI7T6+rFciOU2EGHWCO
         W3w7ngg7yOIxhDlvOEcws/0RAT7Y2H4Bs1dCN6Mvv3Wn+I7z6kY0ci5TUIZJUL9jueLz
         Mv853rS1rCwGicV+237WKJmoeM8YMjDmb6/1CX6Mv2V8pKv74wJ/4Tk4kd5He7mMnI/x
         FNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=eXUe1BR8Hzx0AlRA4j5CpVPQMTfvDQtF6ML2yHdSAeY=;
        b=16DtVTkBnnJ+OgrQ11dapusn4uuMB+ZXpYhe+ZGcjLlV0CW9N/h3KCL3GwRdP5MaGv
         RmwIa2pyGnIxk1zCoABH5qle/M0IUlI7iI1Uq5lWzezxXmWqI2PySMxNJ2C7LNhihkXH
         Ua/IkFQAWdM0OsZlVmUXAA5RFO2RNuF9s6uLa8E3tAeAJN6O84PawHXkBWKDXfjlXnvw
         Bq2J8e0y6UmK2qs0rJhvTmP2VEw0/rwmmuWWXxDN0l7egMti5XUC7d8v0jlrRtwDX2qS
         7q8GQBociEV91erBEuiV0++vDEPO74esnXp19k3oLP0ihymefYGwbVxvZ4ki2w40FmXO
         EOkA==
X-Gm-Message-State: ACgBeo2kqULA9pSF7xJYmYbzlWGjQ2fKbwzDhxgnhAg6/w8oSrO5DKL/
	d/UpKISF8BfU94nNKmG6kfpMZ5+Bwv2GU34QRDqT4L3ctH2yiA==
X-Google-Smtp-Source: AA6agR4mgTRNv+qUiCgrq4Ja1fqwFU7qU+XNa2wihjDKL4vHouD+3kpv8h1DZQapKvmYLeYuftltsKJ3ZtBDQwfk7t8=
X-Received: by 2002:a17:906:228a:b0:731:3a33:326 with SMTP id
 p10-20020a170906228a00b007313a330326mr14235549eja.253.1660678791658; Tue, 16
 Aug 2022 12:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv2Wof_Z4j8wGYapzngei_NjtnGUomb7y34h4VDjrQDBA@mail.gmail.com>
 <CAHk-=wj=u9+0kitx6Z=efRDrGVu_OSUieenyK4ih=TFjZdyMYQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj=u9+0kitx6Z=efRDrGVu_OSUieenyK4ih=TFjZdyMYQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 17 Aug 2022 01:09:40 +0530
Message-ID: <CA+G9fYuLvTmVbyEpU3vrw58QaWfN=Eg8VdrdRei_jmu2Y2OzOg@mail.gmail.com>
Subject: Re: [next] arm64: kernel BUG at fs/inode.c:622 - Internal error: Oops
 - BUG: 0 - pc : clear_inode
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Aug 2022 at 00:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Aug 16, 2022 at 12:00 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > Following kernel BUG found while booting arm64 Qcom dragonboard 410c with
> > Linux next-20220816 kernel Image.
>
> What kind of environment is this?
>
> Havign that inode list corruption makes it smell a *bit* like the
> crazy memory corruption that we saw with the google cloud instances,
> but that would only happen wif you actually use VIRTIO for your
> environment?

This is a physical hardware db410c device.
Following VIRTIO configs enabled.

CONFIG_BLK_MQ_VIRTIO=y
CONFIG_NET_9P_VIRTIO=y
CONFIG_VIRTIO_BLK=y
CONFIG_SCSI_VIRTIO=y
CONFIG_VIRTIO_NET=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_MMIO=y
CONFIG_CRYPTO_DEV_VIRTIO=y


>
> Do you see the same issue with plain v6.0-rc1?

Nope. I do not notice reported BUG on v6.0-rc1.

- Naresh
