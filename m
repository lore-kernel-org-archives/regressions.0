Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D335CB76
	for <regressions@lists.linux.dev>; Thu, 19 Mar 2026 19:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773947647; cv=none; b=JctagrereIReUFQCyQD7yoRdQMXSh4nx/+Aa0dvU8Hbp5HdkEehxJexwV7JF5Z1CjZKiWdq35z+BB2Tebcr7Js2eo3MUCxkeElhGWgJYfT9DSy513Rwo3GP7IRS4SbPxV6Q0Lq7uyyaW9TU2rfETo2USjEyb5I+1VCQ1YIqq7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773947647; c=relaxed/simple;
	bh=dRLGE/W9S0KqzsLMFF78i6JYvxexbZo3FgPUkSy53K0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VPguWlU4R3CKuKw48B86IukHawPbPIdiKoCDLv+7P+3cw4Vo8UQlrYLcJRfZX8slE49XaJTxNiUEbqq5KXz1N/jaHlHgW71Ug5CEtEVSi4Rem6gktXr6NtluKXHriBP/g7HgrkSQ/eX4ub0I4cN1rqmmJelwu8k1g+Q+yyWHOgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=QtxxF+v0; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="QtxxF+v0"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ea87939b3so512173d50.3
        for <regressions@lists.linux.dev>; Thu, 19 Mar 2026 12:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1773947644; x=1774552444; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+9i/c6eNKtdnJhkCliRC20E4C+1N6apMph0naWP04I=;
        b=QtxxF+v0habpewMKScx6tp9LNPNm0YHP/boJE3ME4GgTqOlZdoibX9+BzTFUqg/k4C
         IzqgUEBPUlyVj7dSJpobnObtlTpv+jo0cVvaAmhyQ2CrPTCts2Ypy5WDZGqMJtEI0ZHx
         BFbOIRO7It7bYe+wS5iVVUtdnVnHzZ+W2hnImjZeV/cY5xCh4+1Q5ktKuuRXxxTrx9AT
         YbgtptRGy+9jYo/3d7jAoR+WEew+AaUK+Z9hz4+epcbCPWs1PNVq9bt8/UXOjNGK5ytm
         T1j1Q8mmjEUlJv6bTi8TxWBomZQC8z6MAbUou6N1p9D5jRyZtpwkRDTcZqQ+sGj1Ai23
         3j9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773947644; x=1774552444;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+9i/c6eNKtdnJhkCliRC20E4C+1N6apMph0naWP04I=;
        b=spwBi+qlZF96ozo4n0wgrAhwGAF0a9sqIKzID9vLIwBmr4GwQ4MvBaVy5e/tzuJhY6
         JU7M6xE4gebSn5Dg5lrVioEZYfJwBvTNDvyYV34ca1XFm3O3mSnZuDGZTUUhMlH8+kmn
         w77mbyLbSJmzHLX1aCY8Px9pBykdBULQImMnDuyLPMjBAmK3ZYJ2ybOpptS2Rm9OjnjE
         cajt5c/+R/zwPpP9kgbWEma7f1TcjZpdVs/E6G4FIYhszStsuyswbHFfE5iMr3yedDMm
         FfYnacNtKwm1qaU9BUhBimSmlylMUXlskQO2a95huYzPcp0XOHsv3CFJLU5zTQ8msAeC
         L1yw==
X-Forwarded-Encrypted: i=1; AJvYcCUQjj1iSAHjLIgfqONdDBsUsEJe6e7ib5dIcFqx4PR7xsYK6ux2n+czAHd0tt2K6ZH98z84VCgHECfjGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6vW8FHGqaYVwvkJ/wcvb+pW85MisrnRG/fO1G7/HFBR67sY/n
	c13QfdWYsu0VVJ8XzXPv7l88OhPRrbIuS+BfmeT5BhKqxgIZfFEYpXGiVSZ0WQfy2wc=
X-Gm-Gg: ATEYQzwlGYtyRlL38+WGNhZk9sZ4ufxCdk9+D2w80GtZa2Pke3PGPEgcN9Qk9iETuYR
	BEp/NXVMSv6g8I04/kxmZYvnm/x5GQF7/eOm/qzaslxbZgNBw5N0lhB8BxUdpiyBcqrgn0WQdE9
	JYcWORfqJH+OnriNqcy+3inF6G7gNJEeaJiKDy2NkxGWKyxJ9GSYnCPn3gn3AjoeZhlkKKC8KTh
	/PFWUoNf/rQr/uiIjyCXppeOPT6pUNpkcfnD5Mcr0bINhG8uNPc3vWA5USi9RDeeVoV8EHe9kH0
	pHi6K5djcQ4LJuwlKmwR3sJrbsYst0yzoLvA+b6UwOPYp3Z9i3rYikoUE+66lzeZ5f6bK+W7CnB
	UOM3Q0M3D/9yb1r56jGd/BNvlKrO5cHBxPpdpXP2A5K1HmkvV8e4W8Dkz2NEGz7MsRdCMIsF/Xr
	IeH5v/8Ag7slOqmmMOnyYIS9GjN16427WCBxJnp6ESEKVMupN523NuTFD+e6Fw1JSrUJo1fOAj4
	Y8fY+5APjbE4AFUFIIZUoz9x49IEsIZW27Ubo27XNCbS9agLJF2pW5Reg==
X-Received: by 2002:a05:690e:205f:b0:64a:d80f:5cf with SMTP id 956f58d0204a3-64eaa6dcc9dmr624815d50.25.1773947643607;
        Thu, 19 Mar 2026 12:14:03 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:34be:535:4e85:feb4? ([2600:1700:6476:1430:34be:535:4e85:feb4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91be0e91sm3982346d50.15.2026.03.19.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:14:03 -0700 (PDT)
Message-ID: <27650d0c70f8ccfb8846c03de10d521173e06212.camel@dubeyko.com>
Subject: Re:  [REGRESSION] [PATCH v2] ceph: fix num_ops OBOE when crypto
 allocation fails
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>, "idryomov@gmail.com"	
 <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
 "cfsworks@gmail.com"	 <cfsworks@gmail.com>
Cc: Milind Changire <mchangir@redhat.com>, "stable@vger.kernel.org"	
 <stable@vger.kernel.org>, Xiubo Li <xiubli@redhat.com>,
 "jlayton@kernel.org"	 <jlayton@kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "ceph-devel@vger.kernel.org"	
 <ceph-devel@vger.kernel.org>, "regressions@lists.linux.dev"	
 <regressions@lists.linux.dev>
Date: Thu, 19 Mar 2026 12:14:01 -0700
In-Reply-To: <bae7a16910a7b2cff6b9f8996d93ea72dabb9a6b.camel@ibm.com>
References: <20260318023733.116789-1-CFSworks@gmail.com>
	 <bae7a16910a7b2cff6b9f8996d93ea72dabb9a6b.camel@ibm.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-03-18 at 19:41 +0000, Viacheslav Dubeyko wrote:
> On Tue, 2026-03-17 at 19:37 -0700, Sam Edwards wrote:
> > move_dirty_folio_in_page_array() may fail if the file is encrypted,
> > the
> > dirty folio is not the first in the batch, and it fails to allocate
> > a
> > bounce buffer to hold the ciphertext. When that happens,
> > ceph_process_folio_batch() simply redirties the folio and flushes
> > the
> > current batch -- it can retry that folio in a future batch.
> >=20
> > However, if this failed folio is not contiguous with the last folio
> > that
> > did make it into the batch, then ceph_process_folio_batch() has
> > already
> > incremented `ceph_wbc->num_ops`; because it doesn't follow through
> > and
> > add the discontiguous folio to the array, ceph_submit_write() --
> > which
> > expects that `ceph_wbc->num_ops` accurately reflects the number of
> > contiguous ranges (and therefore the required number of "write
> > extent"
> > ops) in the writeback -- will panic the kernel:
> >=20
> > =C2=A0=C2=A0=C2=A0 BUG_ON(ceph_wbc->op_idx + 1 !=3D req->r_num_ops);
> >=20
> > This issue can be reproduced on affected kernels by writing to
> > fscrypt-enabled CephFS file(s) with a 4KiB-written/4KiB-
> > skipped/repeat
> > pattern (total filesize should not matter) and gradually increasing
> > the
> > system's memory pressure until a bounce buffer allocation fails.
> >=20
> > Fix this crash by decrementing `ceph_wbc->num_ops` back to the
> > correct
> > value when move_dirty_folio_in_page_array() fails, but the folio
> > already
> > started counting a new (i.e. still-empty) extent.
> >=20
> > The defect corrected by this patch has existed since 2022 (see
> > first
> > `Fixes:`), but another bug blocked multi-folio encrypted writeback
> > until
> > recently (see second `Fixes:`). The second commit made it into
> > 6.18.16,
> > 6.19.6, and 7.0-rc1, unmasking the panic in those versions. This
> > patch
> > therefore fixes a regression (panic) introduced by cac190c7674f.
> >=20
> > Cc: stable@vger.kernel.org=C2=A0# v6.18+
> > Fixes: d55207717ded ("ceph: add encryption support to writepage and
> > writepages")
> > Fixes: cac190c7674f ("ceph: fix write storm on fscrypted files")
> > Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> > ---
> >=20
> > Changes v1->v2:
> > - Added a paragraph to the commit log briefly explaining the I/O
> > pattern to
> > =C2=A0 reproduce the issue (thanks Slava)
> >=20
> > - Additionally Cc'd regressions@lists.linux.dev=C2=A0as required when
> > handling
> > =C2=A0 regressions
> >=20
> > Feedback not addressed:
> > - "Commit message should link to the mentioned BUG_ON line in a
> > source listing"
> > =C2=A0=C2=A0=C2=A0 (link would not really help anyone, and the line is =
a moving
> > target anyway)
>=20
> My request was to identify the location of:
>=20
> BUG_ON(ceph_wbc->op_idx + 1 !=3D req->r_num_ops);
>=20
> Because, it's completely not clear from the commit message the
> location of this
> code pattern.
>=20
> There are two possible ways:
> (1) Link
> https://elixir.bootlin.com/linux/v7.0-rc4/source/fs/ceph/addr.c#L1555
> .
> I hope you can see that it includes kernel version. So, if the line
> will change
> with time, then this link always will identify the position of this
> code pattern
> in v7.0-rc4, for example.
>=20
> (2) You can show the function that contains this code pattern:
>=20
> static
> int ceph_submit_write(struct address_space *mapping,
> 			struct writeback_control *wbc,
> 			struct ceph_writeback_ctl *ceph_wbc)
> {
> <skipped>
>=20
> =C2=A0=C2=A0=C2=A0 BUG_ON(ceph_wbc->op_idx + 1 !=3D req->r_num_ops);
>=20
> <skipped>
> }
>=20
> >=20
> > - "Commit message should indicate that ceph_wbc->num_ops is passed
> > to
> > =C2=A0=C2=A0 ceph_osdc_new_request() to explain why ceph_wbc->num_ops =
=3D=3D req-
> > >r_num_ops"
> > =C2=A0=C2=A0=C2=A0 (ceph_wbc->num_ops is easy enough to search; and the=
 cause-
> > >effect of the
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON() is secondary to the central point tha=
t
> > ceph_process_folio_batch()
> > =C2=A0=C2=A0=C2=A0=C2=A0 is responsible for ensuring ceph_wbc->num_ops =
is correct
> > before returning)
> >=20
> > - "An issue should be filed in the Ceph Redmine, linked via
> > Closes:"
> > =C2=A0=C2=A0=C2=A0 (thanks Ilya for clarifying this is unnecessary)
> >=20
> > ---
> > =C2=A0fs/ceph/addr.c | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> > index e87b3bb94ee8..f366e159ffa6 100644
> > --- a/fs/ceph/addr.c
> > +++ b/fs/ceph/addr.c
> > @@ -1366,6 +1366,10 @@ void ceph_process_folio_batch(struct
> > address_space *mapping,
> > =C2=A0		rc =3D move_dirty_folio_in_page_array(mapping, wbc,
> > ceph_wbc,
> > =C2=A0				folio);
> > =C2=A0		if (rc) {
> > +			/* Did we just begin a new contiguous op?
> > Nevermind! */
> > +			if (ceph_wbc->len =3D=3D 0)
> > +				ceph_wbc->num_ops--;
> > +
> > =C2=A0			folio_redirty_for_writepage(wbc, folio);
> > =C2=A0			folio_unlock(folio);
> > =C2=A0			break;
>=20
> Let me run the xfstests for the patch. I'll be back with the result
> ASAP.
>=20
> Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
>=20

I don't see any new issue during the xfstests run.

Tested-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>

Thanks,
Slava.
