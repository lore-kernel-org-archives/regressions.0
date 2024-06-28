Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A13B4428
	for <regressions@lists.linux.dev>; Fri, 28 Jun 2024 00:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536078; cv=none; b=IKdKoqRyFNMA8A8D3KaAq8mK4nrZZbKoUJWmAo7gHO+U/m6HYc0SYndly6GwNzXlFsAVaUcZuFp9k8aXdfTwFvfFz8jYETndHLr2yhWjTTNl+bMdAqxlSd/V9gk/zLPRpMomSKE9IR9hwIuHqVMHn0ASHTGEb0d7jqKJZzWtjDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536078; c=relaxed/simple;
	bh=ftjf9Zry7d4W0sWAh+GqOrORzQ7DO8qY20Opciici6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=erAduWJ2zTbsxzjuEz7zN/soiaPr+6E/F9n0mW+LRM/cI09EjsICIOEALNEai2mUkbS21O0faPUFPxZ4L2p9SxRz5t1mwM3QncLTOJD/rM5SbxMdAJybCVjxQ8FTR6LnKgAwq0HawZS7DQJYyg5KvpAe45czw73+MK1loKiP2sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=dw3FWGCl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="dw3FWGCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719536073;
	bh=nK6ECkNoWWUSbgwv/8Nj8pwVUjgeZlZeQEQ65DI3FjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dw3FWGCl3P1VHFi8yriJUkoxa2i6gMD7vyIVjlRNnE+dSEi+QCTwW0ti6cCo5P4Bs
	 Zp3+N4QjGAhAIo8fSBG3V7is3heKklaJWPI9TaBUyK4mKGrSlcM3YdU88fBX3+PUO0
	 Ov86/kuCrhKKMq/OGTA7/A72/hTPsZeOIaTAcxQ+sxc1670631sByC0lgYD/+XZbTu
	 WjPM68tNBEq7AepAepoqZwDLK0CxECqLpBQxNeKkHmeeTOGzKx9F07F2ovZr1f2oLK
	 1rBKnDY5fQZu705WcZ0eE65kSe4wuCMr9VUjixPNpprQQAkCa2r/iCpo92AVDTJFQW
	 FHBUTpnaglwjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9H5N6hF0z4w2N;
	Fri, 28 Jun 2024 10:54:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, naveen.n.rao@linux.ibm.com, Stefan Berger
 <stefanb@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 jarkko@kernel.org
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
In-Reply-To: <20240617193408.1234365-1-stefanb@linux.ibm.com>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
Date: Fri, 28 Jun 2024 10:54:31 +1000
Message-ID: <87pls1lwe0.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Stefan Berger <stefanb@linux.ibm.com> writes:
> Fix the following type of error message caused by a missing call to
> tpm2_sessions_init() in the IBM vTPM driver:
>
> [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM error 0x01C4
> [    2.987140] ima: Error Communicating to TPM chip, result: -14
>
> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
> index d3989b257f42..1e5b107d1f3b 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
>  		rc = tpm2_get_cc_attrs_tbl(chip);
>  		if (rc)
>  			goto init_irq_cleanup;
> +
> +		rc = tpm2_sessions_init(chip);
> +		if (rc)
> +			goto init_irq_cleanup;
>  	}
>  
>  	return tpm_chip_register(chip);

#regzbot ^introduced: d2add27cf2b8 
