Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63FD3D6A
	for <regressions@lists.linux.dev>; Sun,  3 Sep 2023 23:30:37 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3aa1254fb45so599605b6e.2
        for <regressions@lists.linux.dev>; Sun, 03 Sep 2023 16:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693783836; x=1694388636; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XZOoXJhaVo2TGCTIOjDSMSXw4Rlx/I9OKqXOgCPiDnA=;
        b=g96QTn0FXla1KvVTQlAuGegcGECZjGoHG4+hcCZkOlsRoMMRYvqqW7GjJcGBdxfJvh
         1i+VcF9Qy840nMDXPazxgR4iGmSGmq7a6BL9uXQJlWREUzY88Niuhn+f3EXrxvFjiFlj
         woJZSJml6YLU4wtRlljT+UOH8gEAumJ/XBZqj0sO8W0tbJRh6bIe9HHNdzBwgvgZk5YI
         1CHoqn6Gfb3i7nG8GcrNDBoxFeW+LxHFTF+Us6B16m+krDZw9Vb7x6mk3lfW3ynD/eNj
         kG0kpwJmiC+5nFbpYMpGOYF6chvmY/d9rdu/TaySyJcqzQz4bqMQhb+kSKxvIFWyzUsO
         xJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693783836; x=1694388636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZOoXJhaVo2TGCTIOjDSMSXw4Rlx/I9OKqXOgCPiDnA=;
        b=Dctg95KmEHiSXwG1OHQUPn1cXxRJsE6+Qfaa9RE+RBjzRu5kjpMZL5tPRHuE1JRFkH
         htnOvu00zhtOQcjGNiA7pELJMiA4joehr688S3UKOSjb5uncE9QpEWARlv6apky7q/g2
         qJg7jKzIt5kjGujjwbwXIO1jUiO9B7xhG1Kwuo2iM/je/Gda1eeub/7Y5vY9siNlyekh
         5SIj5wmlk7P8WNXJuaU33QLJDwF7+e5z4fuOTr+agAT+KpvbeDLhnGvhdTPy2rXS1aEq
         Px5t9bCLOb72g4w2j0U7GbDfig/GHFBvkcyMMhWvoqtcgEdswfCZr6DGS3U7/zqkonrQ
         RINg==
X-Gm-Message-State: AOJu0YxFGlq7iN+JwNxJxq0KkFcCvI6BhgKcs5I4yD/wnSKAfo4Yq8Xb
	l4dM5TJTBOLcseQIMmgeeUM=
X-Google-Smtp-Source: AGHT+IE52Ilxt0FJzlGKG879WYPgQGgW7wg05kjjPjvHlrTLhFnh/sEpvS/WCdZUh87TzfzToOxV4A==
X-Received: by 2002:a05:6808:148c:b0:3a9:e8bd:8510 with SMTP id e12-20020a056808148c00b003a9e8bd8510mr10293836oiw.49.1693783836539;
        Sun, 03 Sep 2023 16:30:36 -0700 (PDT)
Received: from luigi.stachecki.net (pool-96-232-116-30.nycmny.fios.verizon.net. [96.232.116.30])
        by smtp.gmail.com with ESMTPSA id b12-20020a0ccd0c000000b0064f59ca89basm3171001qvm.45.2023.09.03.16.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 16:30:36 -0700 (PDT)
Date: Sun, 3 Sep 2023 19:30:59 -0400
From: Tyler Stachecki <stachecki.tyler@gmail.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Atheros 11K <ath11k@lists.infradead.org>
Subject: Re: Fwd: ath11k: QCN9074: ce desc not available for wmi command
Message-ID: <ZPUXMx0H/8U9j15F@luigi.stachecki.net>
References: <1326a6e4-758d-3344-d90c-8a126748b034@gmail.com>
 <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info>
 <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
 <ae1ad814-5613-704e-b0b1-4f1fc4bead44@leemhuis.info>
 <1945f748-fb71-f1c1-83a2-ba0470daf817@quicinc.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1945f748-fb71-f1c1-83a2-ba0470daf817@quicinc.com>

> On 25.07.23 11:17, Manikanta Pubbisetty wrote:
> 
> FWIW, Bagas Sanjaya just forwarded the report and the reporter is not
> CCed afaics (bugzilla privacy policy does not allow this, which
> complicates things a lot :-/ ). You have to use bugzilla to reach the
> reporter: https://bugzilla.kernel.org/show_bug.cgi?id=217536

Hi Manikanta,

I just wanted to report that this is likely related to QCN9074 when the host
system only has 1 MSI-X vector available for the modem and/or related to a
product named "WPEQ-405AX".

I have two different hosts running the exact same kernel, same QCN9074
firmware (WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1), etc. The only
differences are that the one which does not work is running on a slightly
older Intel SBC, with the older one leveraging mPCIe instead of PCIe and
only having one MSI-X vector.

I tried backing out the threaded NAPI commit and, as mentioned, everything
begins working again on the host with 1 MSI-X vector. I have also seen some
other oddities with the system only working with 1 MSI-X vector, such as
the modem not working when I boot with hpet=disabled. I am guessing it is
not related, but mentioning it just in case.

The only other thing I'll mention is that the CE desc errors are *only* seen
after upping the link (via `ip link set wlp1s0 up`). After this point, doing
something as simple as reading the temperature of the modem fails and the
kernel log starts printing the errors described above. Prior to that, however,
no error messages are seen.

I'm happy to be of service to test any changes you might suggest. Thanks
for the threaded NAPI work, by the way - it definitely provides a boost!

Regards,
Tyler
