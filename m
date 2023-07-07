Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF28A7F
	for <regressions@lists.linux.dev>; Fri,  7 Jul 2023 01:56:46 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-47e06acce3bso558717e0c.2
        for <regressions@lists.linux.dev>; Thu, 06 Jul 2023 18:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688695005; x=1691287005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GVrjzhB6jW+MELZlDWpD9snVHwu3Y9sqKf3tzEuK44=;
        b=MV5stPNyloZVMitcziY8nhPCnIFhSujoSKmNdhwOa9Sbgd/t9b084lK5I5hoyn8NCE
         pcQWhClVACtndEfWmmSmTYjGytpHH6irOAJJWEEH8Ct/31r1bVFO7yK6enJEbmrV4ESb
         fHhXBFpzlsBHqMCT8S5+wtoZCW7OcgZpDl5ZMsL/xp0IGcNGhuwjS6FggyS5HMrbkry2
         j0abu4oYVXwvus7LZ2HxkYGvLT3tu3fGdkKQIGOxLqg93dHBA3QCPpO7wIDLKE24f9ro
         BAXfIXfoaXMkVpPyUUIIUMukmO8zq7otmikj08S2KxKKeI7FOUfE0kAkpfYfiBcBTMLc
         z9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688695005; x=1691287005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GVrjzhB6jW+MELZlDWpD9snVHwu3Y9sqKf3tzEuK44=;
        b=fu01DgO9voBsQVx/LpzCDst5EERcXZBPNWzZs043AqfCfWCnuiPW+dAttHfhO/jsHG
         MaCRt+v5un0KVQKmcO9c+ZHYoDCdrTGYqZTx3Y4aZamCvWyo9aRzZaQDKhDs1GGYrIff
         YzEzmBpoNYQUC/D2m1wiAVnYwAS504EEWrFi6yyEG4hwQejGU9MXxc/co7nIJm+THsMO
         gm1gmhNHRYokfceqYg8cN/W77GbI+RKEMC26WdTPKLIcDCxsip8PEhCm//m5ebwPF2xr
         V4W3tjZ5/yTalCEnBapF8VPdpoVlTPL/iT/9be5mk7zG0Veklx2nYX9MnDCFIfnLQ7ab
         5m+A==
X-Gm-Message-State: ABy/qLbUJ5rJY/Xt70YWDmKZRs7OmEeslMvBFMV02gCfdVvv9d9GPL3w
	cwMTfTTOZatxEkz6j3T4Agzw+jZp2gcWMens31I=
X-Google-Smtp-Source: APBJJlFvss+N6tGmF1lydqS+w3Igp/aaRoOnw3LWGedovndHvat2xXGT1r3PKtZxk667gqBXLMtlkzF4gK9mmbTFf7Y=
X-Received: by 2002:a1f:bfc3:0:b0:463:12f:d38e with SMTP id
 p186-20020a1fbfc3000000b00463012fd38emr3215232vkf.1.1688695005294; Thu, 06
 Jul 2023 18:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230429020951.082353595@lindbergh.monkeyblade.net>
 <CAAJw_ZueYAHQtM++4259TXcxQ_btcRQKiX93u85WEs2b2p19wA@mail.gmail.com>
 <ZE0kndhsXNBIb1g7@debian.me> <b9ab37d2-42bf-cc31-a2c0-a9b604e95530@gmail.com>
 <CAAJw_Zug6VCS5ZqTWaFSr9sd85k=tyPm9DEE+mV=AKoECZM+sQ@mail.gmail.com>
 <7fee3284-b9ba-58f4-8118-fe0b99ae6bf7@leemhuis.info> <CAAJw_Zu=MPtGPARgCB2fteP+7F793YDFXE9RuzSH8EqYBS-OOw@mail.gmail.com>
 <64b8732f-6319-9f10-b82a-b4a3dd8d4b8e@lwfinger.net>
In-Reply-To: <64b8732f-6319-9f10-b82a-b4a3dd8d4b8e@lwfinger.net>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Fri, 7 Jul 2023 09:56:34 +0800
Message-ID: <CAAJw_ZvZNQzrFyQizJnKe5PerqqAUOmPYd6cnjAcvs68xNdwSA@mail.gmail.com>
Subject: Re: Linux-6.5 iwlwifi crash
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, lkml <linux-kernel@vger.kernel.org>, 
	Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2023 at 2:11=E2=80=AFAM Larry Finger <Larry.Finger@lwfinger.=
net> wrote:

> Fow what it is worth, my 6.4-git (6.5-rc0?) commit d528014517f2 (pulled t=
oday)
> is working OK with iwlmvm. Lspci says my device is
>
> 04:00.0 Network controller [0280]: Intel Corporation Wireless 7260 [8086:=
08b1]
> (rev 73)
>
> I think you do need to do a bisection.
> Larry


Larry,

I did a bisect and here's what it came up with ... reverted the
following and iwlwiifi worked again.


19898ce9cf8a33e0ac35cb4c7f68de297cc93cb2 is the first bad commit
commit 19898ce9cf8a33e0ac35cb4c7f68de297cc93cb2
Author: Johannes Berg <johannes.berg@intel.com>
Date:   Wed Jun 21 13:12:07 2023 +0300

    wifi: iwlwifi: split 22000.c into multiple files

    Split the configuration list in 22000.c into four new files,
    per new device family, so we don't have this huge unusable
    file. Yes, this duplicates a few small things, but that's
    still much better than what we have now.

    Signed-off-by: Johannes Berg <johannes.berg@intel.com>
    Signed-off-by: Gregory Greenman <gregory.greenman@intel.com>
    Link: https://lore.kernel.org/r/20230621130443.7543603b2ee7.Ia8dd54216d=
341ef1ddc0531f2c9aa30d30536a5d@changeid
    Signed-off-by: Johannes Berg <johannes.berg@intel.com>

 drivers/net/wireless/intel/iwlwifi/Makefile     |   1 +
 drivers/net/wireless/intel/iwlwifi/cfg/22000.c  | 939 +-------------------=
----
 drivers/net/wireless/intel/iwlwifi/cfg/ax210.c  | 452 ++++++++++++
 drivers/net/wireless/intel/iwlwifi/cfg/bz.c     | 523 +++++++++++++
 drivers/net/wireless/intel/iwlwifi/cfg/sc.c     | 214 ++++++
 drivers/net/wireless/intel/iwlwifi/iwl-config.h |   2 +
 drivers/net/wireless/intel/iwlwifi/pcie/drv.c   |   3 +
 7 files changed, 1206 insertions(+), 928 deletions(-)
 create mode 100644 drivers/net/wireless/intel/iwlwifi/cfg/ax210.c
 create mode 100644 drivers/net/wireless/intel/iwlwifi/cfg/bz.c
 create mode 100644 drivers/net/wireless/intel/iwlwifi/cfg/sc.c


My best.,
Jeff

>
>
