Received: from ext7.scm.com (ext7.scm.com [49.12.148.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F345929827E
	for <regressions@lists.linux.dev>; Thu, 16 Apr 2026 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.148.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334392; cv=none; b=WRlCcnUnKA/YsKo28btdB6dU443N9pTk6z2sdysUa6QJCds5R31uMn9XotLf0rCynm8VplTNZNOGoElA0TppS8KVsmXFK4cB21IKEebKkIQ/OiYFSMEPCB3JICbQvcOl9tt08HlhoN7JbIdEmH6sc4gZ4FWdWhZJC/m16Fr0I1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334392; c=relaxed/simple;
	bh=NggszBKPMEDc+pF6nRTUeQteeh+voih6R/w3CPD06Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDi2eDuAHKQO0+KXN7I1rQvSuVKfSoKiSybyQbvD6r3jy55RSM19+Gp/Lskrl/P+DF8ZQBBW8fQzXbQVLvx/L6I9VRZxLLvQZLUqioPg2PR5PBna+BBqaEkuG2C6MzFFsDHBPaQqV9L8I21OfJAUSvRxV4+EbRKUaRLWDC0E9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=scm.com; spf=pass smtp.mailfrom=scm.com; dkim=pass (4096-bit key) header.d=scm.com header.i=@scm.com header.b=uYUdVJ81; arc=none smtp.client-ip=49.12.148.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=scm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=scm.com header.i=@scm.com header.b="uYUdVJ81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scm.com;
	s=ext7dkim24; t=1776334385;
	bh=78twWDv9b7ZPWfAwjWQsmp4OLapanD2Dgd8/clGutKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uYUdVJ8149TtX8UYeWvN7kksbJM1qmX48Wk9G4nYBbzjoZQFsccKNKR6HjSymGfEV
	 n3CNvh2X+NqxHWJFAf5dkQlZ73xpfyBqkxrzdNDzg74FQK7ak1q1CltWfdu3MJJTrb
	 bbhy2ikkUN165FeubKgHmFlaxMzGoSbuI4AQ62w2Y1/VHlggqB5WzkrpHdRQqlcSgY
	 6qzgQE/a+32CB32mlmCno8quf/7pSwIeqlFeRFxBvw1dAkXpXuojvVaeljGlETRnO6
	 UfOPRj2MqmJzZeKc+Aa7NwEAuySiFaFUJ992NTn7it4/QkM/RgS35fzUf3hWO9Iic5
	 HnyCfYV6gwcgAECAo/lDKcfoda9PUXP8kkGIyMJEAJIWQukhOkrXFOYY1K1gqNvfHy
	 F6GhIIvZQ0tdPcG2j0hfGyjmtjEj4c8r8XjQ8nrwnm25R3VSYC9IlRSxuI0AYTGm5E
	 IWSL6SGeCjANn1+e9BmP3WNENVSjelgLopU9v117tSOUA0ZB8uJh1dhxjpBsuE7rrD
	 b10F5fsCzFRmdZDxQZ5PhT6/Z+lfaL//wrFgouTUPECMvrZ8s/T9Cx9yEIiabLgk1X
	 DlzyC6J/5gqLNwXZu8ZRJSd1t9NPGjODj6mLE6Kk59lM0AkJnA2vWeFSuOvGLXCSac
	 IV1tWDc/BLPN+o4KKEd2q6nA=
X-Virus-Scanned: Debian amavisd-new at ext7.scm.com
From: =?UTF-8?B?VG9tw6HFoQ==?= Trnka <trnka@scm.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, linux-block@vger.kernel.org
Subject:
 Re: [REGRESSION][BISECTED] Spurious raid1 device failure triggered by qemu
 direct IO on 6.18+
Date: Thu, 16 Apr 2026 12:13:03 +0200
Message-ID: <2211212.9o76ZdvQCi@mintaka.ncbr.muni.cz>
In-Reply-To: <ad-0LIubzaT8M2_O@kbusch-mbp>
References:
 <2982107.4sosBPzcNG@electra> <ad-sprBWPA20iola@kbusch-mbp>
 <ad-0LIubzaT8M2_O@kbusch-mbp>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The proposed patch fixes the issue for me and doesn't cause any visible issues 
(in normal operation, I didn't test actual device failure). Thanks a lot for 
such a speedy fix, looking forward for the final version to test as well.

> ---
> diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
> index c33099925f230..cf1c25f290f36 100644
> --- a/drivers/md/raid1-10.c
> +++ b/drivers/md/raid1-10.c
> @@ -293,8 +293,16 @@ static inline bool raid1_should_read_first(struct mddev
> *mddev, * bio with REQ_RAHEAD or REQ_NOWAIT can fail at anytime, before
> such IO is * submitted to the underlying disks, hence don't record
> badblocks or retry * in this case.
> + *
> + * BLK_STS_INVAL means the request itself is malformed (e.g. unaligned
> + * buffers that violate DMA constraints).  Retrying on another mirror will
> + * fail the same way, and counting it against the device is wrong.
>   */
>  static inline bool raid1_should_handle_error(struct bio *bio)
>  {
> -	return !(bio->bi_opf & (REQ_RAHEAD | REQ_NOWAIT));
> +	if (bio->bi_opf & (REQ_RAHEAD | REQ_NOWAIT))
> +		return false;
> +	if (bio->bi_status == BLK_STS_INVAL)
> +		return false;
> +	return true;
>  }
> --




