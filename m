Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158725;
	b=BFTK2L60JxF07pPLRZatPfWX1e5u2IRMi2x1tdR3BXPorXGDHCSb4DChCKyJfOi851qs
	 ufTI1jEF6O2B5fIrVjjAp0vbPWGGgUhKw3mHtvIkNL20iHrIYL+04JixkQngEj2M3bEeZ
	 UqnKPGM236ZMwiitVsRJIIr5y0ITz0bhKGUFMbc/xBsDAG3YFrOPSMmiFCeSo5EVx+Tp9
	 zb7a17YdfxwAb1KtUFn2f0OPuKlTYCn4hOb9sLkYTxwFSob5FIko23tG47q6y1fp2x/mS
	 DWSo2E6Ltsn+lID/FTqVJkcSwaNNhYIab1ll0Crdz7k740njSsfc7A+6SQxT+6liEEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=VQJFWsO2O0YbolYW05VDBIkhficw7DwnVaUUdw0UKuM=;
	b=FqzguqezvlzjV3ZlUE66tzigTZgl3tdXA/0SPY6S3rEbb4lYbp5tbiJpOB5kRu+/1W9M
	 XQMxqR3ICOQEOpx/fwvyDrWFliKBasfKLkDghHXlFPZN6DD2mYGtgYhPmiBQTjV7/lRPe
	 j1c+AcJhNfJiuQc+eUy2wqHA34ZZ9xfrr0wT82cYZpwOeMbyxo3FUT9NXLBs4Lu1/p6IE
	 3FnVczrsjR9hn9Oe552+cJ2m8kly8EQKzlrkZmKABKHLV5RNQKEvB6FqyemdrbN55b1B+
	 yHgHiq1u9cclrGi+zQCn5My2H6mbNgk5jetcusBGTEaaor1XnAObTnIp+VjmNK9MeVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pkZFlw48;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AFB606A31E
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 03:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5AFB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pkZFlw48
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ea1e7fad99so2776905ad.1
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 20:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158724; x=1793763524; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VQJFWsO2O0YbolYW05VDBIkhficw7DwnVaUUdw0UKuM=;
        b=pkZFlw48jSjCr/g1HMMaJmT9wVR6tokD2UhAqCWHNmEKmzgHb/BxLKoiOF/kpSAeOU
         TKFMm8jXI9Etv+4pqabJnOQZqvqYsuqWY2a/8KTVZ9N8IGz4I+l322gkSGpTwiUhU3Y3
         7bw+7x4/w9cdPj4hGjm3DXZR4d75iJ2j+lvIS1+/B0tsZnoRFst17aSJNUmu1edRrt2i
         zXv6ZJTZY1vNiBxBqlrDptwYcZl4iBV4kmluV2t72BGZqQhe9ugjzf/ydRrE5LJIAQfD
         c2155BRwYcd8WLyXLdtbXD2t/Uyj4BBU9146EIRUGk2vD5NhmNp7m/DlWITBZYy/TGtY
         vwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158724; x=1793763524;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQJFWsO2O0YbolYW05VDBIkhficw7DwnVaUUdw0UKuM=;
        b=K3f9qoeWB/laICZv77V798MoMxLIsDzduSZp5wjjUW96jV/5O00Mi96Fyyzy2fygn1
         wlTmzZL/Wk1oTiYWOjNsUv92rc7ABJvhxm2dl0QzqaKxv1Nu8BotBbp9ZKPRpDeBQ5hH
         dvtDFu37hr5gOtA2iNvTXbwu1ACEwM4vciTnvZxjYxa7cA64cwGMbtfMqeiBxRJWAKp7
         ucLN75WBC80u2d1eyfCYgmg0StzB9BIdqEK9hpgZgWh1BNthaeHbd5IsmKnrPUzGt5wD
         rVh7uBsATsiEUjniSAWPklqxTPcQDceqvXpKAeL1YUp09hQLrYTvLLHZYHFAazBND6iQ
         OsSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw17zn6xvKS3lTzebmW9Ixdth6qMDferjM3SAxbcAbxgElQ98F6kCY6CxdJoXvQH/G2T8trvR+ng3DVpQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYItgy8KTSS9+Y7B4/xsY5xxXbw7enIajDE7HuR0d7W100o89ZMW
	vMKp8vQgLE8KXNuj9PZvvbO0YikwicrQ6q17bFAcjR+uZ+p93XDWBHQN
X-Gm-Gg: AYBFou1Zm4d6Yyd0H3LvMUx/7aleVntbqlu0k44HJ2KtO2kuM6opGpRAFvQKcRvOR9z
	mJlDDVd2oog0yVb3hVfpmOUI8/USjv08AV8vghuFITQXgIad0YAkspZ1YW9Eav9djEhR+UV1NA+
	IcD7TPRoodMv/Lbg74JNi01TmgScHMadZweofRkS+4ERB2Kkx1tqEFN1h7pQj1axLLu9DcDnf80
	uLqVYk3IreBH9y4gcATlVuw1wRnVQ0MMJfKEBpAsreQwH47SZF7hPPNNL3nkNV9DppcXsNmZa32
	VJ1JCqS3A5NkcXJyG4ToN+TsBFH04rxctDNfzQ87e1/VYfCFgBQPBkoaPDpREpSVgX+DXIVw+Bd
	wIZC5jftAbOc7Kwi04O64mvaJkeeJBg3bNMBWUXHmX+/cF+Mk4mfIKLKcZflRcCvCiJZEk9RVr7
	f+RiHF3iNK70nfohpzL6Hlm7Hkd2gs+oyf6vo47MG5hsrNeQvEbS0OwOTROs2xYJFfrOilgrPYx
	GJmZOl7Iw6qjVRiBommzJWc/nyXevGc4pb+2+BWeGGlmAc9PiAo1LdXfCfcCmAIrpWv38u6ZFqp
	JlMyWzU3bLfC8pMtdcFwfPqy27WpWoQUJ0e8BJDP3KM2VaNZwfNuvqMsIiwRycOUsA4=
X-Received: by 2002:a17:902:c40e:b0:2e9:8202:5083 with SMTP id d9443c01a7336-2eb0051eb1emr13234255ad.55.1793158723876;
        Tue, 27 Oct 2026 20:38:43 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bdde77sm15882685ad.31.2026.10.27.20.38.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 20:38:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <20261027161813.3092f32c@kernel.org>
Date: Wed, 28 Oct 2026 11:38:24 +0800
Cc: netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <D0F0DCA1-9CAB-4BB3-92CF-223C9ECA9BF5@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <20261027161813.3092f32c@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On Wed, 28 Oct 2026, Jakub Kicinski wrote:
> Is this your real name? We need a real names for code contributions.

Sorry, it is not. My real name is Yongjian Wang. If you can fix it up
when applying, please use this identity as the author and sign-off on
both patches (and in the Reported-by of patch 2):

Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Otherwise I am happy to resend a v2 with the corrected identity.

Thanks,
Yongjian

