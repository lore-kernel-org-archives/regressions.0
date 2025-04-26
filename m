Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F53325D538
	for <regressions@lists.linux.dev>; Sat, 26 Apr 2025 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694082; cv=none; b=BErnTXNvfxVDQTxUqEpGMIMMocRHKFIOYYxiu+VW51PmD6+RAifByxc9GHTf9ww46ioTKkJLioKyWYbsQkGjkHguL2cEfmhXRMyV3+HcYH0iX2gdAdRW96Jl/M7QCObBRRG0nPMI4TJNVt6Kc4vgTMtH3SiOTGfNiRHkZZDIKCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694082; c=relaxed/simple;
	bh=6eYtJAMSoeb1a3iNNJm3O4AydlW0VV64TCk/PZstfeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTP4u11in2br13s5ahFP4XtPhNxUAOoayivRpNFDT9Q//yjrkqE8D9VrFHoK/c43F+Z+LqScPAo5r7KUkl9VrrKf6eogpoLKVOKNyesd62M2bTRHN+ZD4Njr8GEEQhZaBzTr4RjVOag0OJVKNRVY1yaCrP6ijkXBwaGuwLygnL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrrKoi/c; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrrKoi/c"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac29fd22163so485238366b.3
        for <regressions@lists.linux.dev>; Sat, 26 Apr 2025 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745694079; x=1746298879; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DSiz65NZCYWQM6lMeNMM9nhjabU+GJnKDwhHRBHA/0=;
        b=jrrKoi/cQC/YJdIjRsG73y/sS2DoxC1fctkiYSHeXIA6E3ZIS79FItYupS1Yn5mnTi
         QsXDP6NpVvIVHK6QRCF4VYrnctqnbSxrVSH1zAclhqu1D/Ff3nb4b8+7vXxAgDDFP0B/
         rDd0H0fZ4Md8y35jFzrlEwg8rzytJRGIMxpBJZ8YOJxainodIIrvlZxLIKFxhI9NAPBq
         p+wokLTX+BpphtArKk2cS8m0070mBFNcLC4ORXWvJO+bPFEhCpjrcI2nyi6j4P8O11oz
         NJzidwX6BX7OIpxsvpTqQBFwdz/w2tc4BAcCogXIhOcRDlGwyM01dIgvTyaOdveawZ7a
         /BBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745694079; x=1746298879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DSiz65NZCYWQM6lMeNMM9nhjabU+GJnKDwhHRBHA/0=;
        b=pgAmEmM5hAKbEG/VN+VTQlDsiLVRH04pItlbqunkuH7LHWbpPWWq0uZOGBLMfM7ehe
         uferHPZ02c+ynazoeu+cPz4hTv/tKK88YDp8uAwETY8pgXT8YyHZ8rnFnB40694aXxIs
         oyuOtLOZRX1Ti+3uSAekqjZUgNs+E96EaYP7QrH3yarYV0U2fkVPu7J3Sr+ySD/D6KGH
         NPh/BX5JBWHvXLJc8+AO9qgxoVajQprSSNMPIot6nhUDiHNRN80aTU2yfeyKCqs2FWOS
         qKjho+HE3UqFywXq0PxGfi4dr1dWalNjv63OmA9mqllFC29XxF0aMSJsKqkZrnWiXMdM
         9wVw==
X-Forwarded-Encrypted: i=1; AJvYcCUyrErLdNxMmyf8JqhRRa5iQOdoaGIl3IqcS7t0Ihv2maJdsFqU4H8LPiGDEPOUrTlE+PwiEysj737naA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJdC4SzrWgrCZMumKddfVCx7RWzwrbqCv8VpaO304865Ee7M2U
	bE6HrgsY6YiqfL6bsKLQiVClll1aR3vHbGcXlIPSNLVWKe+P0OIw
X-Gm-Gg: ASbGncuKvPVCn76fWupgbDNkvLL7HbilHJ+jjSKJI3otfU/TuPMWg2vFksalqk91nVd
	y6i5WczShLcdR/GUKby3jlsezFEib7EBYV6vXSdiUMAf0Mz7ezISH4QpOMMdAiRIU829LErcmoT
	uw6CerHOTy5dMHv23Lx6uRP7WdW7Lgwi/SggCGpCHlKzaeBeypWRhDjCnNR3TIVb7QcvwJd3rHq
	y2TIo24FGfl55/nWgG/+ydTUc9IxQUtS6uL2d5FHdYt64x8nvF2NflWl3jHxr+cJJ64ceycVtvF
	uHHnp5KQBh2gRNb/b+dBqiju3J5iNmZPdIzCJ8CGeQyYwXyhdMHKHVjBJV2qDrtTM7iuomm15gB
	bcCIGNyk3KZz0MDQVpDyswWsjHdC7wQ==
X-Google-Smtp-Source: AGHT+IEU/Ta6sDdbD/3ls/Tp7hQ8m9X1EKPfRK95gW+d5V/QiwndMyaR55m3PMPPHakL61V9ORovPw==
X-Received: by 2002:a17:907:2d1e:b0:ace:3105:afcd with SMTP id a640c23a62f3a-ace71039266mr598844066b.4.1745694078507;
        Sat, 26 Apr 2025 12:01:18 -0700 (PDT)
Received: from [192.168.0.10] (ip-37-248-156-10.multi.internet.cyfrowypolsat.pl. [37.248.156.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed71fe7sm322307866b.134.2025.04.26.12.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 12:01:18 -0700 (PDT)
Message-ID: <cd66bf64-6da2-4550-afeb-cdc279da22d4@gmail.com>
Date: Sat, 26 Apr 2025 21:01:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
To: Mark Brown <broonie@kernel.org>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
 <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
 <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
 <1b850037-8361-4c18-a32d-3ca50b69866e@amd.com>
 <691c35de-f054-40a1-98bb-2b602e256011@amd.com>
 <PH7PR12MB595192A0E69D3350F5544DB8E9852@PH7PR12MB5951.namprd12.prod.outlook.com>
 <70293c18-f17d-48e4-94b9-4e7f62cfa45e@sirena.org.uk>
Content-Language: en-US, pl
From: =?UTF-8?Q?Jacek_=C5=81uczak?= <difrost.kernel@gmail.com>
In-Reply-To: <70293c18-f17d-48e4-94b9-4e7f62cfa45e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/24/25 7:51 PM, Mark Brown wrote:
> On Thu, Apr 24, 2025 at 04:53:45PM +0000, Prasad, Prasad wrote:
>> On 4/24/2025 12:57 AM, Mario Limonciello wrote:
>>> Reverting a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90 seems to help the
>>> issue on S16 here.
>>> Jacek - can you reproduce with that reverted?
>> We will send a fix patch to resolve this issue.
> Excellent, thanks for jumping on this.  There was an AMD CC on the
> original report so I'd thought it'd have been seen.


Mark,

thanks for taking care of this one!

Cheers,

-Jacek

