Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950FC19ADBA
	for <regressions@lists.linux.dev>; Fri, 20 Dec 2024 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734724201; cv=none; b=DGQt86uNOIdL6gZ6R6nfP1/jvxYEu/yoagrZahUsxeImiDJWXKXK/l/FCzE825nig3Mf0UNt5NJUyH85byfOMkKYZkT7s1LApzplV2Hs4xpe/qLyzcIwzjJTlEI0GlbT9SQ7I9InJa6MXGQKIybnzmZeko8fnPZrSYiDU27WKeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734724201; c=relaxed/simple;
	bh=EpsJakmyH9YSpaer6E1J1FTY7JPT3aDCwC4b8DqvOJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zz+RFTPRMY9UcaImlYd+LU8ZkUHOybO1XQEuIuL70sJzRdlPV3IU6hcS2MymiABFrF9cUp7BRK/1MYbJ4EJtLorlMipmKpdkWvu4Zo9C9K4Ah4qB2Rnh4RjfofMms5miBs1zRet+ECDSbwhnlBRYIstq8e6aF2nvifKbl/aO7zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cj9DwAaD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj9DwAaD"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so3619876a12.1
        for <regressions@lists.linux.dev>; Fri, 20 Dec 2024 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734724198; x=1735328998; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CC7HPO/I2vxnnbATSGWhXRaNRcFje7+bdn9wnsTcce4=;
        b=cj9DwAaDILH6tNxenxlhmbth+V5OySjsiMZo0uUTQQkiVXb/O5EsXamC1/Ws/w+zLj
         94ktcBoi/hFu9gfEtYjeIAq4ECDkexy2nUn6beFdqqQHSl0KVg0CxeSmkfFWU2BfQkYI
         rwBI5IpUwOFzz8oRQkHrcx2xolVxDkEkReGpvTymyI/tIo+mxaZzyYVtF7gilD05FSNB
         rcs+puPAAnmLfDQ1bDRCYnCTDDHBkPuzAbDEOvQgt9R0zVOcEA75m38vovHpDUhIRy+R
         ucubcBKG2ICni4yrx7P6HeWOk9QgvrxulFyd/L5bHfhlPkpDUzyIaZa+yx8RfHuCji8l
         eh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734724198; x=1735328998;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC7HPO/I2vxnnbATSGWhXRaNRcFje7+bdn9wnsTcce4=;
        b=XWepvWQqToc9IfNuNCNzeeNvf/Je65WSItGojipr5obm/ktvwV/+2clq1xic0lkaqV
         3LB4CE3pUs3J8wrTe/7ynlRgB6lSwdHfwoPUC91qMMF9vqYd62YrlGRHWWFEFGJhb1IW
         8ONOhHrScr/lRHm76gurZ4/I4/daN4y/9BqVQfyb9Gp3pdaD3VXnl0j6m2A2/3JX5YM4
         SxgTax1IOx2CLxZYW37J8ScDQphNybh+A8F6QedkeNgFRDr+BZ6F/Ou3QrFvemX2FMkc
         CEf22XqYvtVQa+UhYNli2BMsDG21j8PHDxYh9SJM2eeWyDAj86T5H3UG/VNDO2yrq3Ax
         wuZQ==
X-Gm-Message-State: AOJu0YyE730an408rT3pLiKLtDKk6cA7lTSgh8p22MbmkDUKXtPfFJ7N
	O2xRKVVG2T8CRjq1ZzENU+MG5iTcaeTDA1PcZL25bRyRF5OaSS25
X-Gm-Gg: ASbGncsyNf6jw3ieceXjTZNhE/joUtpajIVEeWy+r6TtU/STDCdOaLZZis9nqZTcIBF
	XbfZPI2sLI4LJ5ogI83ZhDdckVUQdiNm6XbFNrgh6zmrM9sxJBR2XL3NIUt2gcMh2p97vxd0pz9
	miBeY2VJdC+Fuw3l+FQk53GPjUQH7xy+qScj6WvG4fON7CMn/N/0AU+IwWOgXQSg7JUI4mxSWuU
	aUF3pAYXp3/LErRpfarpWaNfWQy/0L4MJLUTus209fw0MiCos1Ubx60JxalYCY+G+U0us92QBOn
	7m3pB2VrDMJFgH78
X-Google-Smtp-Source: AGHT+IFdVrNmfcy1kGOF3NSBclOemYsDkCUQHayb8FORkO0KPdukKE0qeYugOEgfwCT7kyptMaY5kw==
X-Received: by 2002:a05:6402:1e90:b0:5d3:ff30:b4cc with SMTP id 4fb4d7f45d1cf-5d81de39866mr3841332a12.33.1734724197570;
        Fri, 20 Dec 2024 11:49:57 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c5a4sm2008707a12.38.2024.12.20.11.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:49:56 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 8C044BE2EE7; Fri, 20 Dec 2024 20:49:55 +0100 (CET)
Date: Fri, 20 Dec 2024 20:49:55 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: regressions@lists.linux.dev, Zhao Mengmeng <zhaomengmeng@kylinos.cn>,
	Jan Kara <jack@suse.cz>
Cc: Daniel Reichelt <debian@nachtgeist.net>, linux-kernel@vger.kernel.org
Subject: [regression] linux: Loop-mounted UDF ISOs no  longer readable
Message-ID: <Z2XKY0f6on1UbwWb@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan, hi Zhao,

In Debian we got he following report, full quoted below from Daniel
Reichelt, dass after updating to 6.1.115 (and later, confirmed up to
6.1.119), loop-mounted UDF ISOs are no longer readable:

> Hi,
> 
> in 6.1.112-1 I could loop-mount Windows Setup ISOs (downloaded from M$; hashes
> are fine; 10/11, DE/EN don't seem to make any difference) and access their
> content perfectly fine, i.e. share the /sources/ sub-directory via samba for
> netinstall scenarios.
> 
> Starting with 6.1.115-1, the ISOs can be mounted, the root-dir is accessible
> and `stat $mntpt/sources` gives output as well. However `ls $mntpt/sources`
> hangs and the kernel log is spammed with entries like
> 
> ---------------8<-------------------------
> 2024-12-11T14:53:19.616728+01:00 srv kernel: [182394.024828] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> 2024-12-11T14:53:19.629970+01:00 srv kernel: [182394.038041] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> 2024-12-11T14:53:19.641623+01:00 srv kernel: [182394.049714] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> 2024-12-11T14:53:19.654841+01:00 srv kernel: [182394.062928] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> 2024-12-11T14:53:19.666495+01:00 srv kernel: [182394.074615] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> 2024-12-11T14:53:19.679747+01:00 srv kernel: [182394.087833] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> 2024-12-11T14:53:19.691394+01:00 srv kernel: [182394.099510] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> 2024-12-11T14:53:19.704646+01:00 srv kernel: [182394.112727] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> 2024-12-11T14:53:19.716283+01:00 srv kernel: [182394.124400] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> 2024-12-11T14:53:19.729539+01:00 srv kernel: [182394.137618] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> 2024-12-11T14:53:19.741185+01:00 srv kernel: [182394.149279] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> 2024-12-11T14:53:19.754422+01:00 srv kernel: [182394.162494] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> 2024-12-11T14:53:19.766071+01:00 srv kernel: [182394.174159] UDF-fs: error (device loop3): udf_fiiter_advance_blk: extent after position 12272 not allocated in directory (ino 312)
> 2024-12-11T14:53:19.779289+01:00 srv kernel: [182394.187375] UDF-fs: error (device loop3): udf_verify_fi: directory (ino 312) has too big (2088) entry at pos 12272
> ---------------8<-------------------------
> 
> 
> 6.1.119-1 shows the same behaviour.
> Let me know if you need additional info.

We have not a full bisect, but Daniel confirmed already in
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1089698#22 some
observations:

> OK:
>   6.1.112-1
> BAD:
>   6.1.115-1
>   6.1.119-1
> OK again:
>   6.3.1-1~exp1
>   current trixie
>   current sid

(current trixie is 6.11.10 based kernel, current sid is based on
6.12.5 kernel).

Dies this ring some bell to you?

#regzbot introduced: v6.1.112..v6.1.115
#regzbot monitor: https://bugs.debian.org/1089698

Regards,
Salvatore
