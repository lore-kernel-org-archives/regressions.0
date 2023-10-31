Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E452E199DC
	for <regressions@lists.linux.dev>; Tue, 31 Oct 2023 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUi5r8Po"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so79804051fa.2
        for <regressions@lists.linux.dev>; Tue, 31 Oct 2023 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698790512; x=1699395312; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nZsj+AfOY0spxTisMoArNXhnnKSbd2tnGFeggkpIho=;
        b=KUi5r8PoO6zNNyn1j+T3iu5YKzxKX4wt02/957rmiLwRrIvslB6vUxuBO3PA/9sH8s
         R6eeNO49sD1yAqq1GcDKxVOj29pmIUyrfWsMaLqNMwkTAUBYGcUJKPkvQoqdFxl92qmm
         lVUokqwLFJOGETHQU1SvLWk4bWwvLLPIZMhMnnxtBF0ZtY1xWuzKpZD3DuS5WxLjOnot
         9xVprUrBuw8R8y5sM14AHVeGab+oEbtG7KUYCvP1R3bxkCwPTS3fL0nlNu0uyFjSPa7T
         DpOMbN/tkzMDHz1WnnNNRsHJY2YwUduYLaOMv2tW2sIm5l+eAOB9qbUU4uqtxTgjHltq
         6NXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698790512; x=1699395312;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nZsj+AfOY0spxTisMoArNXhnnKSbd2tnGFeggkpIho=;
        b=Y1+jJo2Km/eB81xKrjbST8Gy+Hx/NVsriDIphERFlY1WvVysa2HnC0ToEpWPIgcjLf
         4zOHUDBRrMSYFeTA0nimWTwARFD0JiTlQpAbBHxkaj9qdF2KGGH+qQRMWYDwryRU9K9D
         eJi/3HfMPq2WxG12hC2y6MpcdphRWaGycJSa4iEBU7SjK4/4/3EQAAd5RWsK7NG3Bgcm
         01n0dPsT0v3Mgnkm0i5QNIzY0dEk5kgam+sHfcVoQcIodklkUGau354w1ho9RAIQz93b
         Kl6cGsEMGtTXqHC9kQCgrnGydy6Idpk+Dy3J+bzVqEh0iy8bFj0wMrDT/3OOnbwx44Or
         NPiQ==
X-Gm-Message-State: AOJu0YyGL3rC0fS8ugOGAEXnYtJmFDuOiEsr4MmP0lDkPa90ryRVlNwr
	/Zr3eTc5pnMDjg6NZdsqK5g=
X-Google-Smtp-Source: AGHT+IFUJkmKnTlNM3eRoWukUht05K2CCKE+eMRQXaMITsgnFMh2M95EPetfMMsr28J5oLwNJeSDrg==
X-Received: by 2002:a2e:1454:0:b0:2c5:169f:ff03 with SMTP id 20-20020a2e1454000000b002c5169fff03mr9751364lju.5.1698790511467;
        Tue, 31 Oct 2023 15:15:11 -0700 (PDT)
Received: from debian ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b003fc16ee2864sm2930790wmb.48.2023.10.31.15.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 15:15:11 -0700 (PDT)
Date: Tue, 31 Oct 2023 22:15:09 +0000
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev
Subject: mainline build failure due to 5cfd69775eb5 ("bcachefs: Array bounds
 fixes")
Message-ID: <ZUF8bYTl5SBlbBBJ@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build arm64 allmodconfig
with a native build on an arm64 host with the error:

In file included from fs/bcachefs/btree_io.c:11:
fs/bcachefs/btree_update_interior.h: In function 'want_new_bset':
fs/bcachefs/btree_update_interior.h:274:36: error: array subscript 0 is outside the bounds of an interior zero-length array 'struct bkey_packed[0]' [-Werror=zero-length-bounds]
  274 |   __bch_btree_u64s_remaining(c, b, &bne->keys.start[0]);
      |                                    ^~~~~~~~~~~~~~~~~~~
In file included from fs/bcachefs/bcachefs.h:206,
                 from fs/bcachefs/btree_io.c:3:
fs/bcachefs/bcachefs_format.h:2344:21: note: while referencing 'start'
 2344 |  struct bkey_packed start[0];
      |                     ^~~~~

git bisect pointed to 5cfd69775eb5 ("bcachefs: Array bounds fixes").

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: 5cfd69775eb5460ef78bb5034a37eb0dc52ab65d

-- 
Regards
Sudip
