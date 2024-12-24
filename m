Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07661186E2E
	for <regressions@lists.linux.dev>; Tue, 24 Dec 2024 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735040537; cv=none; b=Pi88ZXYxOA/BDdhHWaMkRMbZrt2nnfAy0CFTv9BFXYeUr6EjWbP6iqJoP7afMoxkZqb5huvEdr/zCAbMamwJ1LxRD2UKgDJzZXXj5D95JkPmUkYzrugO7FJXhUa01OkoCJB0sbai030nDhoANHuOgSlDxivkjXZDNsyvFVfHkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735040537; c=relaxed/simple;
	bh=kpa+rLnv1SfbpuxivhCGjy34IhRzBY8tlzwwa+8vBr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ug6A1idgDO1WYNSBKapq3RCJqPdHJnBepwHZ3bAFdATU09VLD5MBiIzW0GmwSmXxN88Do/uopu7Ah8EyjSUOXJ7BpVCjnpp5++544LNUOvq6GMWlXJ7XqWM6F4A9OOyco/qt18oRQpAqxJEC2C+u2mUqVYKcRKdTi/ztJPRlFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgDOrt40; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgDOrt40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735040533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OsMm2kkhF+Z9V26v62JgcmGA5nEWPAdaI8pCOc96qj0=;
	b=HgDOrt40yogagE/czHAMY7KJeCq8MYzWOHKENyHntnraUMDKSltrXBhg7aaKSC3DHw00ai
	epmmQQEH7SwiOG5czhHmQS1rwkoLQSvZxJbxUDRghExKVET6dmidzMjTw1isVsMsQZ8ZoU
	j1onLpMnv3uB7F5sNkx0/QV7D2w1kSY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-6pcoPc-pOf2E6WizcZT4rg-1; Tue, 24 Dec 2024 06:42:10 -0500
X-MC-Unique: 6pcoPc-pOf2E6WizcZT4rg-1
X-Mimecast-MFC-AGG-ID: 6pcoPc-pOf2E6WizcZT4rg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4362b9c1641so25609945e9.3
        for <regressions@lists.linux.dev>; Tue, 24 Dec 2024 03:42:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735040529; x=1735645329;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsMm2kkhF+Z9V26v62JgcmGA5nEWPAdaI8pCOc96qj0=;
        b=W+O4eCzz2qVnazDzBLSDlG8+YxEnXTkrhyUrBvI93fUgktl+L1d6dP+Y+17aWnd1kH
         2cKMEr8bFfgX7iurYg5CdVtYbWW8HzU+I4R+FdhaOY9DWXzAOmd6Lugh09CFAd5/ZFqC
         LC7FIo9MbFfDLRMetikjsDXRfsPm2PJurqg1tYvcE9c0Vzvwd2T15UoqqpU5+r3+ATVM
         NN4fIphP9TNh6ivaDNUZGfAT8VLGkeuybDNnx0ecVF4xqGhDztadudDa0yEnY1NyMZZq
         g1Ix1KvrOll+3d/KULYIy1x4PS9PGiEsONig5stNx+vGF0cPt1Je7MSy2BQ3DKg2H4Gj
         rMvA==
X-Forwarded-Encrypted: i=1; AJvYcCXllr02zosyUtj/09xnKOlGunjKFnGLvGFSrQ9ddbCEHdOfdUp+XnE8Aa3eyOTfQ05tkciIDnYlJ8M/Ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvJ6bgB2BRBPI7e4RPtoBAQXu3w55hSrkr9NvNd6lvsM3P6bUI
	0T2QN4SVUJrO+QmPvMUOEU93WX2Fbp7k1nH2XYOY9PeLJZZoL5aMRFl6Xo1cNMITeAbLvDRtUoo
	b3M1/blaTj/RStqPWXI5kECXYZbdM+X4BUREcMlV0FGj5K/RA31YRKWfRD+bW
X-Gm-Gg: ASbGncuWpexawYI3iyHPJfAqQ72BVKuTsQTSlNPZ4ApYHHKj9OsN6xaxVjviFmAM1yD
	kaUAXb9MyBWYCr0cd4G4jq+Yesu8s+4gcUncAIxaaTcC2TZx8dtYmmCfJ5i6GLFwahjjrvyRIR2
	5jtslhD5Dv9r1mooeJLIRbpTSCBFyeCcl6WekH1zJ6/2CK1v/7xzDK0Dh/V5TxvTwHy92X2fUSw
	Ui75G4m1WTEsaO/nUKNmlO+MjvNVQ1RnEGpiYsLQDmVPMwLik5ixnsOk6eG
X-Received: by 2002:a05:600c:350b:b0:434:f131:1e6d with SMTP id 5b1f17b1804b1-43668643203mr169420455e9.10.1735040529211;
        Tue, 24 Dec 2024 03:42:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbMh6wotEMWfZpgZnRHDkBfi3Bo6yh/+8fe8z0DOTLB74hdFgMsTqORdX5QKmkwoOy37B4aQ==
X-Received: by 2002:a05:600c:350b:b0:434:f131:1e6d with SMTP id 5b1f17b1804b1-43668643203mr169420245e9.10.1735040528851;
        Tue, 24 Dec 2024 03:42:08 -0800 (PST)
Received: from [192.168.10.27] ([151.81.118.45])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b42757sm201972855e9.39.2024.12.24.03.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 03:42:08 -0800 (PST)
Message-ID: <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
Date: Tue, 24 Dec 2024 12:42:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
 <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5mOy1tlLP74_1LEHKzZDk5q1al8dhKPxfvfVzo_I1yE_1735040529
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/24 12:05, Christian Zigotzky wrote:
> Hello Paolo,
> 
> Thanks a lot for your patch.
> 
> I tested it with the RC4 of kernel 6.13 today but unfortunately it 
> doesn't solve the KVM HV issue. The guest system doesn't boot and I 
> can't see any error messages. (console=ttyS0)

But do you see anything on the host dmesg (without and with the patch), 
for example a WARN?

Also you might try edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 + the patch, 
to see if there are two bugs.

Paolo

