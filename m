Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54EAD30
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 18:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169ACC433C9
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687545551;
	bh=3UowwxFSn70DlgDYyW0skic5HR5RMWOVAExiS2/BiBc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sjsr3dWDt9+IkJJxBVqH6M7uc5J+1Wp3Ebb3g2r237NKfhmzLqn26tUuMzCFJ0oK3
	 WALxpL7MdnoAVhKZLEDJrJxnqC0wmXeEGaEaTRuVkNfkoHHNR+7F7UyThS/mqIvzws
	 WvKaGdCbatnZKhoShhDpe/Pd26o+UNBv/Swrntc8IAuRZ+oAR+XzHL4ktxoYAGNExl
	 QtWrMLwMDFNYaPu83zQl6ZCyx7CrrNLF0pZDyr5xsnJVfWcIiss3p+isG4FqR+2PtV
	 NLacNADTekkNB+gpH4Y/sZdI9cWNaKsupcRKgbrYkOSASi2RSmJMRmHwqI9n8/pQBv
	 AEVHtk6mAsi6Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b47bfd4e45so16265421fa.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 11:39:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDx11xLty7WhGgmlYWs/qV2XAeKD8mdO9KkqQVZaD64yGya2kUFL
	UKRKwQNNBetog7bblgUfw2u/YfLUWQ9K8/ZdtvU=
X-Google-Smtp-Source: ACHHUZ4SR6zSznmoBTp36ac9MGQldmAXgPQHqZoG/f+maEMbFY6jZGzu6nSxJ3ZgdkpMMyE7MNmogB2EHwXOIi8ea/k=
X-Received: by 2002:a19:5e42:0:b0:4f7:5e8b:2acf with SMTP id
 z2-20020a195e42000000b004f75e8b2acfmr13562679lfi.44.1687545549131; Fri, 23
 Jun 2023 11:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me> <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9p2ZLJUMq96vhkiSgvJkxP5BxE778MhY5Ou2WdxLVEJyg@mail.gmail.com>
 <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com> <CzNbNfn7R2cqLMD6_jp11Dku0OoXYJhx2AMfk8JXeQVP2EGdt7tqeYD4HH0COhp2o_yj5kN6Ao7oObSelRi8yiz-5ltbQ2xtjBvplvgcZjo=@proton.me>
In-Reply-To: <CzNbNfn7R2cqLMD6_jp11Dku0OoXYJhx2AMfk8JXeQVP2EGdt7tqeYD4HH0COhp2o_yj5kN6Ao7oObSelRi8yiz-5ltbQ2xtjBvplvgcZjo=@proton.me>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jun 2023 20:38:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGb+RfMQeOui8uzXBFRchfWhpnEsxOo84Y-LLBqk=z5Uw@mail.gmail.com>
Message-ID: <CAMj1kXGb+RfMQeOui8uzXBFRchfWhpnEsxOo84Y-LLBqk=z5Uw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: Sami Korkalainen <sami.korkalainen@proton.me>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, regressions@leemhuis.info, 
	Andrew Lunn <andrew@lunn.ch>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Stable <stable@vger.kernel.org>, Linux Regressions <regressions@lists.linux.dev>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jun 2023 at 20:20, Sami Korkalainen
<sami.korkalainen@proton.me> wrote:
>

Please don't send me encrypted emails.
