Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67734FBF6
	for <regressions@lists.linux.dev>; Sun,  9 Jul 2023 16:32:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9926623e367so473322966b.0
        for <regressions@lists.linux.dev>; Sun, 09 Jul 2023 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688920325; x=1691512325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t6q+aOy2r+flgQCJZwvu7LKyLs8yIYN/+XSC8dA1GdM=;
        b=gAn+QFrFr5ulawjYCYTO7VmTQzHU5lgWSC5NEnzugmdYhNVwnmToW+MQ4reDvuq6l7
         PzP2nnDKMv8tyPbAMBaFVMjpeYKtX/i/KRcWvIp4fd9RpwmjkD31sHkkt+5HXaKSjBzT
         4EDltBMvryK/qN2k9UurMRUANtYKeMK9ETJQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688920325; x=1691512325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6q+aOy2r+flgQCJZwvu7LKyLs8yIYN/+XSC8dA1GdM=;
        b=bB0bcZ8Ft6KLEuYoxA6hVV/1olg66jvBPXgTHtSyyd0Yw1++46VX/I1xGNwn3Jn+UL
         n8KIdj70jalXjw2xJ3qBU6G1/rA5M0ygYxGmB3soS8rerpJTHP0rRWe0fEUvj37J6rHs
         P4fSX46SQ2vbqh7AdvNFE3t7k5eCPaDYSqigeNjcWQWbiGBks6wpoKjR33L+DtcMYyS1
         FyZBqL/0LtdSe3s0k3f5S4RIkg87tLMxnP8zJ2k0mhXlF50lpaTGRdZ303Y5DZVSjgPF
         f+yxCL6QRR/faiLUbaSVHN4tnGS7o39WlnGhqtNmqe2mp4Q40gMt2ZGgO64IcNQVGzPN
         3vXw==
X-Gm-Message-State: ABy/qLbuJqCGjr0Dk5an0Xl69Se2OjQzTtVoALRqBYgBW/yKyFaUJcwS
	jKLk5OUuNmNy8lDpF05OtAWDrsE3VcJmEli3p6ohdc64
X-Google-Smtp-Source: APBJJlFcCuR2xrrE43oyj09Q4DKYfHr1TnBfTUcsO2lRBrjJ3Lnxxgqnh0V1HYbKLyilyhst7tMlIg==
X-Received: by 2002:a17:906:b41:b0:991:f6d0:9bc1 with SMTP id v1-20020a1709060b4100b00991f6d09bc1mr8639382ejg.66.1688920325289;
        Sun, 09 Jul 2023 09:32:05 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id o22-20020a17090611d600b00991e2b5a27dsm4961102eja.37.2023.07.09.09.32.04
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 09:32:04 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-314313f127fso3757107f8f.1
        for <regressions@lists.linux.dev>; Sun, 09 Jul 2023 09:32:04 -0700 (PDT)
X-Received: by 2002:a5d:54c2:0:b0:313:f22c:7549 with SMTP id
 x2-20020a5d54c2000000b00313f22c7549mr8377726wrv.66.1688920324114; Sun, 09 Jul
 2023 09:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b533071f38804247f06da9e52a04f15cce7a3836.camel@intel.com> <a4265090-d6b8-b185-a400-b09b27a347cc@leemhuis.info>
In-Reply-To: <a4265090-d6b8-b185-a400-b09b27a347cc@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Jul 2023 09:31:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg23SdKRcn2W+BWWEfJ2Efp0sreJx9=iw0AsUPjW3qznw@mail.gmail.com>
Message-ID: <CAHk-=wg23SdKRcn2W+BWWEfJ2Efp0sreJx9=iw0AsUPjW3qznw@mail.gmail.com>
Subject: Re: [Regression][BISECTED] kernel boot hang after 19898ce9cf8a
 ("wifi: iwlwifi: split 22000.c into multiple files")
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Zhang, Rui" <rui.zhang@intel.com>, "Greenman, Gregory" <gregory.greenman@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Baruch, Yaara" <yaara.baruch@intel.com>, 
	"Ben Ami, Golan" <golan.ben.ami@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Sisodiya, Mukesh" <mukesh.sisodiya@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Jul 2023 at 03:55, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the regression list, netdev, the net maintainers, and Linus;
> Johannes and Kalle as well, but just for the record, they afaik are
> unavailable]

So I will release rc1 with this issue, but remind me - if it hasn't
had any traction next week and the radio silence continues, I'll just
revert it all.

From a quick look, "revert it all" ends up being

  fd006d60e833: "wifi: iwlwifi: remove support of A0 version of FM RF"
  a701177bd4bc: "wifi: iwlwifi: cfg: clean up Bz module firmware lines"
  f4daceae4087: "wifi: iwlwifi: pcie: add device id 51F1 for killer 1675"
  399762de769c: "wifi: iwlwifi: bump FW API to 83 for AX/BZ/SC devices"
  31aeae2446d5: "wifi: iwlwifi: cfg: remove trailing dash from FW_PRE constants"
  ecf11f4e4950: "wifi: iwlwifi: also unify Ma device configurations"
  bfed356b4fc4: "wifi: iwlwifi: also unify Sc device configurations"
  3fd31289d5de: "wifi: iwlwifi: unify Bz/Gl device configurations"
  e3597e28a2fa: "wifi: iwlwifi: pcie: also drop jacket from info macro"
  0f21d7d56083: "wifi: iwlwifi: remove support for *nJ devices"
  c648e926d021: "wifi: iwlwifi: don't load old firmware for 22000"
  a7de384c9399: "wifi: iwlwifi: don't load old firmware for ax210"
  a13707f7c845: "wifi: iwlwifi: don't load old firmware for Bz"
  508b4a1baeb3: "wifi: iwlwifi: don't load old firmware for Sc"
  5afe98b2e299: "wifi: iwlwifi: give Sc devices their own family"
  19898ce9cf8a: "wifi: iwlwifi: split 22000.c into multiple files"

since clearly nothing seems to be happening on this front, and summer
vacations are only going to get worse.

But we'll give it another week. In August huge chunks of Europe will
go on vacation.

                    Linus
