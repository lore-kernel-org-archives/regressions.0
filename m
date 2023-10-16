Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADACB30FB2
	for <regressions@lists.linux.dev>; Mon, 16 Oct 2023 17:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtGcWAgw"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so56587771fa.3
        for <regressions@lists.linux.dev>; Mon, 16 Oct 2023 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697476821; x=1698081621; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWfEcOW2L2k+xynXBCBlj/nQZn7LeFqtR6Gjd7zepfs=;
        b=PtGcWAgwHyMcjQRfBGCB/xaWv8eVnSIy2hiu6uResjxCQPEaR5/2Yf2xJxAiR2KGp2
         tkuC6BEJRFceG2MctSkkv5mGWmf0U/+YB3qbc4LkK0N3DTPqaq2h067N9C7HSYNonY1r
         t/1xK8al8sXac77xy3H8py6QkjP2vB3aJee44Nbtzn3RhfTAdcV6Zf52LPt9IXmHtCV0
         pqxWgjbu2kw7BW4+GeFxoBVXqtiXh7XwCjeF20U8tZm53M/n3gkoaPKBWg0zZuxVdhdq
         zb+3iz2gmTJzIsLJUwJR8XJgP9rvGTnytxfwYhG904YFobkWxL799t6itOhZ0dyJ+fBw
         /Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476821; x=1698081621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWfEcOW2L2k+xynXBCBlj/nQZn7LeFqtR6Gjd7zepfs=;
        b=S2P0Mi1Yd4tX8wSFP5GhnFFohy2mvQ3fhxO5K4wiV3kCOZT++013B0RKCC8RlikU70
         y2DRehvbPpaUm6usXjL5qIRWdDUBpe4fn0lvlOcva9oo86FdawwlrbmFRTznZ8bSUyID
         s6QKi2w4Yw3j0t+2ndIGoH6QzPN51UTFdYiDDCpsTJboIhO5frKbO/UVRmud4ZPOe1zk
         1acE02Ie0Vrjiop80gZHsifzz5saAl7MdEMlrHjpSKVO5M06626A+a63nRQ5C72R0Mri
         nxeOZgpvxn2KMYjAznoWMsJf2PGQhuvFAflKW1z/48gCdIiwggyOnzA5PdISruI+buin
         ttmA==
X-Gm-Message-State: AOJu0YwTD6PNh4GHvh+HG7iPqWB1rqXvawmesEiok4TfRgZEjQxz5rsk
	KjhNG+xgjdUyso88pZh+leR2pnDof/qCj1e/EnytnPWAuDh6Tbm8vAc=
X-Google-Smtp-Source: AGHT+IF2KK3u6oHn5v2ieTIixFskEeBndJgyefW265kYtHWhHf+XSTJUCHXRnfFojA+kwjzqISEjSDw2QnvSo3UlVdw=
X-Received: by 2002:a2e:b8c5:0:b0:2c5:1122:9712 with SMTP id
 s5-20020a2eb8c5000000b002c511229712mr6532429ljp.46.1697476820513; Mon, 16 Oct
 2023 10:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231006024707.413349-1-max.chou@realtek.com> <169664042379.23949.8315443049400174883.git-patchwork-notify@kernel.org>
 <0ee79296-a404-4d0d-b8ed-42578a77692c@leemhuis.info>
In-Reply-To: <0ee79296-a404-4d0d-b8ed-42578a77692c@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 16 Oct 2023 10:20:07 -0700
Message-ID: <CABBYNZ+DcF=q3tH9ZYTEhsrPgygU+hsYwYNEZf-3VwuiyzHXog@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btrtl: Ignore error return for hci_devcd_register()
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: patchwork-bot+bluetooth@kernel.org, Max Chou <max.chou@realtek.com>, 
	marcel@holtmann.org, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex_lu@realsil.com.cn, hildawu@realtek.com, 
	kirill@shutemov.name, bagasdotme@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 16, 2023 at 1:07=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 07.10.23 03:00, patchwork-bot+bluetooth@kernel.org wrote:
> >
> > This patch was applied to bluetooth/bluetooth-next.git (master)
> > by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
>
> Hi Luiz. Many thx for picking this up. From the branch name is sounds
> like you plan to submit this change in the next merge window (If I
> misread the signs feel free to ignore this mail!). Wouldn't it be better
> to merge this in this cycle, as the commit afaics fixes a regression
> that was only introduced this cycle?

It is part of the for-net pull-request:

https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/tag=
/?h=3Dfor-net-2023-10-13


--=20
Luiz Augusto von Dentz
