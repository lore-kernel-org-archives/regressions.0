Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153C1137F
	for <regressions@lists.linux.dev>; Wed,  5 Jul 2023 07:24:38 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9926623e367so732485566b.0
        for <regressions@lists.linux.dev>; Wed, 05 Jul 2023 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688541877; x=1691133877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yBZ2V9YkgQb75fgLLwSDoK6jYDOYm9Ulfp2E4lReMu4=;
        b=Ft35BGtfPjUdUryqBygCiZrglZi6RQf2Uq33+EgA0PHGC9flgpkea796/5npXeaU++
         Fih8p0t82f+/DG0P3vVkiv8BOKDDFO8KYd3a223NUyrQRCyzPihenOF/qCb3hyDFpwOw
         RjkFpPbNfnlrOaGNK75AbYq/jninFCMWeiwYLCAXZyZrJwmBv4NZxcg0AiUVVShaeR8S
         8oaaOAKXVRP7xLGGvvS6kyRoZci1QMmuBHVtTvY+2Pj9aFdV/EQLboUzRBt06GCj4MDc
         CgzOd9blKo7RLN5OYBur6/Q2WG0hSwUGI6S7zz+3G6o5ctC829YZJOBXasBINlzadVee
         LB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688541877; x=1691133877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBZ2V9YkgQb75fgLLwSDoK6jYDOYm9Ulfp2E4lReMu4=;
        b=BVqdyWZWgEbVJy2MrX4hFO5zjhckLqTZoNE3YPLGhT1bfWe0Ij+HrOcawoOVkpdznK
         xTi09rqO2pjGaKsxtLFLPV/dmPeKnzLl4hnzC3KC2owpj8U5+R3QA2qyA8DIaGUxkEyO
         otfUy7MG4NHy6A7Nas+qry04TQqV1tSXX1QkAdR0uyanWi57q5EmxT+ak8G/aHgTwnpg
         gav2xVLzmdTz7u4usWSeqtKp+A4NSTeZJfoG4aVVghN9Nwfx2NCifdwhzFfWqaEODw5+
         0j8mhvKOS1gOOTg6yZXjvU7aM9XzKvRO32f4csVqvuUnwn/SMa4T333oVUAsDC68xjo/
         YMhg==
X-Gm-Message-State: AC+VfDz5fmh0chb4A75/L+8FCHLYZC1pPIAGqJg7zNE6G2u/cACNRwAh
	GKo+43F/jS8iIXsggCGE7Mrn1Ay26oFbcwMw+N4=
X-Google-Smtp-Source: APBJJlEzktWAFzDyfTdF5aq95BVbZzgxZ4ow0qDGxVedpqTLBRPqSrErSM08kh3Ba8Fnen97931YBN7ZnQZfEtTq87k=
X-Received: by 2002:a17:907:100c:b0:973:ca9c:3e43 with SMTP id
 ox12-20020a170907100c00b00973ca9c3e43mr10435369ejb.45.1688541876875; Wed, 05
 Jul 2023 00:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230429020951.082353595@lindbergh.monkeyblade.net>
 <CAAJw_ZueYAHQtM++4259TXcxQ_btcRQKiX93u85WEs2b2p19wA@mail.gmail.com>
 <ZE0kndhsXNBIb1g7@debian.me> <b9ab37d2-42bf-cc31-a2c0-a9b604e95530@gmail.com>
In-Reply-To: <b9ab37d2-42bf-cc31-a2c0-a9b604e95530@gmail.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Wed, 5 Jul 2023 15:24:23 +0800
Message-ID: <CAAJw_Zug6VCS5ZqTWaFSr9sd85k=tyPm9DEE+mV=AKoECZM+sQ@mail.gmail.com>
Subject: Linux-6.5 iwlwifi crash
To: lkml <linux-kernel@vger.kernel.org>
Cc: Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Latest linux-6.4 after June 27 crash my whole linux notebook once
iwlwifi is loaded. Anyone seeing this?

Bisect? Or there's a patch for this?

# modprobe iwlwifi
... Whole system frozen!


Here's my system before the crash ...

# dmesg
cfg80211: Loading compiled-in X.509 certificates for regulatory database
Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
iwlwifi 0000:00:14.3: api flags index 2 larger than supported by driver
thermal thermal_zone1: failed to read out thermal zone (-61)
iwlwifi 0000:00:14.3: Sorry - debug buffer is only 4096K while you
requested 65536K

# lspci
00:14.3 Network controller: Intel Corporation Alder Lake-P PCH CNVi
WiFi (rev 01)

# linux git log
commit d528014517f2b0531862c02865b9d4c908019dc4 (HEAD -> master,
origin/master, origin/HEAD)
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jul 4 15:05:12 2023 -0700

# lsmodModule                  Size  Used by
iwlmvm                397312  0
mac80211              626688  1 iwlmvm
iwlwifi               307200  1 iwlmvm
cfg80211              413696  3 iwlmvm,iwlwifi,mac80211


Bisect?

Thanks,
Jeff.
