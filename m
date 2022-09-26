Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB263A
	for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 10:27:18 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 129so4721518pgc.5
        for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=C8rX11bO0E5A9d+MVyn6i3C/40tS4roRj787StsOFrw=;
        b=lbODLGrycZbW3aySNFBK2tNaiw+EJ9Hs7QLs5p2ZS4dbB/I8xFEzRe9/44qLPmmg5o
         YiZTJYC9CRsURi3DjHKUL8pzTk54WUrd7xki+q0dZhulhKrUhjKCq4WNL2ItD9ZdOPVz
         qXUQYEuUtiSf0L56gO5+9PqCEbzhRFj12C3BgEYAjuV8b8YnhbbnWFjo8sZ9PHQ2Rl67
         ztdRdL5z5izMfb3LaYymCDvsHN3slUfwQtckZ5V3GPXI33zJJn0zAmTTcV7Su6atEKr+
         sPG6oVoVT2qf5HSHB45J+fPoPoi55hhovs38h18SeMJOzk+g9oeqoyTYraVphqOplFh/
         MK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=C8rX11bO0E5A9d+MVyn6i3C/40tS4roRj787StsOFrw=;
        b=T5Vrc4eeVdsbbyBf2Phx0Gx+rS5pIj120gPQKZjVozsOoI74zgWSkHXNb5LZTXLgiV
         nIiHBLrp2HAQdpqNibx+i0BFPgTx6Lfg2CVC1X8VLyh8zYOJ1PuXpuVGjOVnr0scP4uM
         rD4VpZuBffJAiIp0FKifT7reFxeYSrfU3brkZw1j3u0p0bpauq3UfEsz+4lCPCf2gkwX
         bhAAcC5sDwFtybkJ7p2yGcCOsXRLxgV3/NsJ5jYowzWI3QY9X40w/nCGD+Eh0Qp3fW4q
         qyZ/eVrGq++aby24EYqIMcM5mn0+m5wvkTDAhOAbh+0yC8GoN3FhQr58CSgN/fHNNVIR
         0V6w==
X-Gm-Message-State: ACrzQf0mQ7PQjf/9WfsIdw2NxdZi7dQtJa3fNySYRLInn5qtKZxFRczZ
	nbzW602royoasQCahlOtf1/wBPs8Czm7ierZZLM=
X-Google-Smtp-Source: AMsMyM5DrN3IbbsoTe5WI4Fp/tfb0WeoIEJzl3snUphNtI1RjqLbpPr1YKNGATrULX5M8to6GHbfEA8Shm8pZYH5vgU=
X-Received: by 2002:a63:1f49:0:b0:43b:a2df:857 with SMTP id
 q9-20020a631f49000000b0043ba2df0857mr19845053pgm.137.1664188037524; Mon, 26
 Sep 2022 03:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsP0znm9pS-MiKtyxTXR7XiyFVqen0qzNpicGHDZKCzbwg@mail.gmail.com>
 <4e7992e2-c635-e571-faa3-08fd9ee5c975@leemhuis.info>
In-Reply-To: <4e7992e2-c635-e571-faa3-08fd9ee5c975@leemhuis.info>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 26 Sep 2022 15:27:06 +0500
Message-ID: <CABXGCsPg4mEe0RfJeXCGQ_WatbHgGi16Xw9DFKxPLV8QNi777A@mail.gmail.com>
Subject: Re: After commit 44fa75f207d8a106bc75e6230db61e961fdbf8a8 Wi-Fi
 (mt7921e) speed significantly decreased
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: jelonek.jonas@gmail.com, johannes.berg@intel.com, 
	lorenzo.bianconi83@gmail.com, sean.wang@mediatek.com, 
	Linux List Kernel Mailing <linux-wireless@vger.kernel.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 26, 2022 at 9:38 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> FWIW, there is a patch under discussion fixing a problem found in that
> commit:
>
> https://lore.kernel.org/all/20220829144147.484787-2-jelonek.jonas@gmail.com/
>
> To quote the first para:
>
> ```
> This patch modifies the annotation of supported tx-power levels for a
> wifi device in ieee80211_hw. This annotation was introduced with commit
> 44fa75f207d8a106bc75e6230db61e961fdbf8a8 to be able to operate on power
> indices instead of absolute power values, providing better support for
> different hardware capabilities.
> ```
>
> Not totally sure if that might be relevant to your problem

I checked this patch and it did not solve my issue.

-- 
Best Regards,
Mike Gavrilov.
