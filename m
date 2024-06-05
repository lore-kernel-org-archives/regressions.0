Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC910979
	for <regressions@lists.linux.dev>; Wed,  5 Jun 2024 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717595650; cv=none; b=hNuJFO78w440kfC24mP/fD7I3I4tAPCDr2hl+lxHOUgVK2RYd1RwOMEvIfUkjm59UmInOy7wO5TBVoOIfBNQDxmFumRMCEkM6WvIZ8PGXinvfO5LhtT/DeU32vm9rf39Z98EuOyOMGDyXnq1qB9SZ/M9q1ES9EqDepsbWSoG4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717595650; c=relaxed/simple;
	bh=KgtgECh8TfWkkBQSSaUQ2WLQ2CDSch8PaxsQ2s7DuN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyHxlgHFLW1WK2lUuSGu2aFFcS7BIlWKoDfxY10TN4142pywNtAtOiph/XZ8I1Vf+kO0DXAbxCLj5czrJ1MUz2yIUCF6Lv+UTELgo8nrUz/39jAc2xUHJsEG2yx9QthKdmwZ5spT9pLggIQZecotojh+9UIHdr0HHprnhNkRaxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfQ0wlgf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfQ0wlgf"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a62ef52e837so275102366b.3
        for <regressions@lists.linux.dev>; Wed, 05 Jun 2024 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717595647; x=1718200447; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QTYnKO28j3YI9ux1Zgv39qkSZnMjwNV2K+hqhI8JYnc=;
        b=zfQ0wlgfPBSqCrxCKUQhJvgBKrVSdmW6jE9yg0n9alAO/vGFbGWL5Weqx2pDGrem94
         4sJuw8b9ZhcveL65TxntmGOyl1PrbkBs+28B9yOjKpft9wu0fCXD7z6k7e5R8oD+Td0L
         2fjSRCQDvcLZYKsIcQSHYLViU4Ta8ZpukGJ+JsCvn8PEHF0dAfXtqeYB7mJiyuXVMcjc
         j+TzyuoxKV4bV7NdxD9+ulGUecwbFwR6Bg9QW5vYJ/j8As4uU8tGE/a6NmfFLcMphESH
         aR2DbyNUcSdozCwahEgKlbnZC8ZnqnT6P+5W6/QXlHmCf2EEl9cxJsbyEJQzs//gOZYR
         2DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717595647; x=1718200447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTYnKO28j3YI9ux1Zgv39qkSZnMjwNV2K+hqhI8JYnc=;
        b=ULJkpnKLV0XGcsf7qBgIuw1CEq14rtlxLqnVBb/3BT6Vdxsy9f1jwlk5FfSt4MfMVl
         BenX1WntPdL+TTChZT5jcgpPzNtfw6QidIwrIDcDhhcxUkrNhfGal/Z/74snFdwv3fE3
         21vlihn8vl8lSUvK817uS8qGqi9uK0I4UY/tHc5cXVdC9G34o6KDaC806lykEXdyYdkh
         Ter9Rcl+Op8Y54EljW/tSfAcTfXbU+JnqN2vTaDpcwWi/N2DZYYYDcwozEF3MCr11AGw
         Q7MUIb4s0uj81qjSqgGcuk3q73sVb63RAKmQHv0U0y3yr0A9oelOocp8PuZCLnnHWbNg
         gX0g==
X-Forwarded-Encrypted: i=1; AJvYcCWYrhGBDVzPw4PKtECtAr1TLee5ZpCF5/hulGbkxs3JDfQ1J8UMFJ84zHYyDXJZjQFRPJPYogkhZ6Zm/siw50FKRUQCcvOCJHYCm0A=
X-Gm-Message-State: AOJu0Yzb9/9z1VsRKXM1m+mYaFhAgiqHO+0kZYRtf2QeSgxxBUBCf5Dq
	rlt4r7nlMKg3LYMGzaGVbMRf7tieX6Ak7eaN/o9g/AKKS/Z9B/nceFCsIxGGMf0=
X-Google-Smtp-Source: AGHT+IFdZN11IhO+Wzyc/C0Q4Y5W12qxkiMbqEoJ7pPfnvvovPjrkZuFmtGBH6F4gxxBTXjxG8vPLQ==
X-Received: by 2002:a17:906:2750:b0:a68:f1ca:a8df with SMTP id a640c23a62f3a-a69a0016ed5mr163026566b.71.1717595647239;
        Wed, 05 Jun 2024 06:54:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b7b8c33asm642098566b.69.2024.06.05.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 06:54:06 -0700 (PDT)
Date: Wed, 5 Jun 2024 16:53:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-nfs@vger.kernel.org, NeilBrown <neilb@suse.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>, kasong@tencent.com,
	LTP List <ltp@lists.linux.it>
Subject: Re: WARNING: at fs/nfs/nfs3xdr.c:188 encode_filename3 on rk3399
Message-ID: <ec11cd23-18a8-443c-8dc4-bb444a15b35b@moroto.mountain>
References: <CA+G9fYuzd9Cz2Ndwc7HFOimJPRZL7w376N=2R2cV-d0mjzT+nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuzd9Cz2Ndwc7HFOimJPRZL7w376N=2R2cV-d0mjzT+nw@mail.gmail.com>

On Thu, May 30, 2024 at 06:54:05PM +0530, Naresh Kamboju wrote:
> The following kernel warning has been noticed while running LTP statvfs01
> testcase on arm64 device rk3399-rock-pi-4b with NFS mounted test setup and
> started from Linux next-20240522 tag and till next-20240529.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Test log:
> -----
> mke2fs 1.47.0 (5-Feb-2023)
> tst_test.c:1131: TINFO: Mounting /dev/loop0 to /scratch/ltp-9gvw[
> 5211.161721] EXT4-fs (loop0): mounting ext2 file system using the ext4
> subsystem
> F2L8n6/LTP_stadLH0F7/mntpoint fstyp=ext2 flags=0
> [ 5211.169391] EXT4-fs (loop0): mounted filesystem
> af9dfac2-88f6-453d-9d02-c14cc888a51d r/w without journal. Quota mode:
> none.
> statvfs01.c:32: TPASS: statvfs(TEST_PATH, &buf) passed
> [ 5211.175518] ------------[ cut here ]------------
> statvfs01.c:44: TPASS: creat(valid_fname, 0444) returned fd 3
> [ 5211.175938] WARNING: CPU: 5 PID: 786885 at fs/nfs/nfs3xdr.c:188
> encode_filename3+0x4c/0x60

I believe this was be fixed by Neil's patch which was merged:

https://lore.kernel.org/all/171693789645.27191.13475059024941012614@noble.neil.brown.name/

regards,
dan carpenter

