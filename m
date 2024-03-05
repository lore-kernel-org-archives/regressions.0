Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A605B5DD
	for <regressions@lists.linux.dev>; Tue,  5 Mar 2024 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635186; cv=none; b=gybe0H1bL4JvGPh+fjPnoa3Bmi9JX2kWNmUwkUcIxfuU061mnakhgcbgIi2pBBHac+fx60C1tm7ubYzYPuuHLmML5RQALEOO4i7iIdNPAW2MdMHr7SNwtMSyBFUt1o6CLeKVLLC7/YXPlsCxE7h64a41sDfbw684Uz29pxJVAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635186; c=relaxed/simple;
	bh=pFdYAnZdJkey2fB1AXbz9SK46Qgp8Uv9r7+q1l7WKMo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fcC3Px7Pz8IveeN5F569clw0jLD/mM3O2df4PteJahz7/oRx27POcQ64R7yd9RZgvRJdajS6QbSC9EadOMczquePnVvpB/MhtOA8gkE7cRyfLNTKJ3JkwryGA06KNKTGWmXWnK3AKnLMdg2thk+3BoQQLsh/VoPAUQkR2o6kJQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deu3g8Vw; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deu3g8Vw"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c78573f294so22291239f.0
        for <regressions@lists.linux.dev>; Tue, 05 Mar 2024 02:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709635184; x=1710239984; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pFdYAnZdJkey2fB1AXbz9SK46Qgp8Uv9r7+q1l7WKMo=;
        b=deu3g8VwhMH0tZC0RlrfhMbNlir3oKiXiPPnwBbP02PSC745TWEXQNRH040SAUgA+0
         OevDXBtN6oJcjC+sfEsES8JYJ5K3bhJjzhmvl2/P/245Y4z9VoVa1aZL4WzfU8MNGizC
         lZTCHkbRn4/V1/Kw/cg5NFxFC+sDoT/ECEbPuj1Q2YjFDn4hN1k72KU+61rgvbP5yt/q
         wsOYaNSoncvjqz4yE7r+2wpg0J8NqMZkVkheTCSl+GEtoicfxtuA13T+uQ+4dJ10B69e
         weDERffieWBkKH+EfHOeaVZKLBh+L1FOtuH6fYZ2+k98p8COlj/0QmyiEzOQJN7Gl+UE
         SZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709635184; x=1710239984;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pFdYAnZdJkey2fB1AXbz9SK46Qgp8Uv9r7+q1l7WKMo=;
        b=RLyTDhU10XanYTw7RJeSCxoamCwlAxU/sbljSYm4QneiEUi9qY+8AC27lmpdytDLZn
         ZFx5XGZ9eeQCuCQ6QvBfrTwO1lyXoF1kc3Wg+tuKVGS9Xdc0qKYZ1cwesSbEGzuPQpuF
         c6PQATjogGgQUclRvPNe1ZupYRMYhTMT2QAgw3C2DdubOu2Yv3eBDpapgIaLlp1xG/2B
         EicA12uVh/TlB2CQX1DbtFE1njxCVT6iUUA3qJE8uXnU472DtNZcrd7f3Aw46GZPWHFg
         aK65PNGSbTrKFfvDfmU/0CSCFcSX67gPokdZOmLvegG0vjNOMoHaCbtpbDchSv1YEJAi
         1QfA==
X-Forwarded-Encrypted: i=1; AJvYcCXVsVguUixJCBMVBxF/6CV2lU34NyXyWiCUQTXq0X4zx000SG9A2QK8iP4V4hB2hC+nhx5/4gv/vfDV47bfy4kpWfMinTgDBpIUI/Y=
X-Gm-Message-State: AOJu0Yym4NKO5OIuy8nO4AsuDuJZvMJH57ftBYTijSvlL9MFm5tMbFaT
	Uz0CpyrpbggzJYYNnraBRDwt2Q/hKIoieigGgz37dO44uYmWgOpKfChOY+nc+CrOv+PKL1MLWFa
	kQoxJ/LHkhwjVtM2gHTU9TXpWiT0H2z1FjyU70g==
X-Google-Smtp-Source: AGHT+IHXewfnOMLd4nsI0abW4hEBKxDQ5wmxfSkGzuHLsYPW7rSimdeSKDK536GOszGfWSsdAecIXmaCFXlJjF252hY=
X-Received: by 2002:a6b:d912:0:b0:7c8:5946:f45a with SMTP id
 r18-20020a6bd912000000b007c85946f45amr4576400ioc.7.1709635183767; Tue, 05 Mar
 2024 02:39:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Eric Hagberg <ehagberg@gmail.com>
Date: Tue, 5 Mar 2024 05:39:32 -0500
Message-ID: <CAJbxNHe3EJ88ABB1aZ8bYZq=a36F0TFST1Fqu4fkugvyU_fjhw@mail.gmail.com>
Subject: Re: [REGRESSION] kexec does firmware reboot in kernel v6.7.6
To: me@pavinjoseph.com
Cc: dave.hansen@linux.intel.com, regressions@lists.linux.dev, 
	stable@vger.kernel.org, steve.wahl@hpe.com
Content-Type: text/plain; charset="UTF-8"

To add another datapoint to this - I've seen the same problem on Dell
PowerEdge R6615 servers... but no others.

The problem also crept into the 6.1.79 kernel with the commit
mentioned earlier, and is fixed by reverting that commit. Adding
nogbpages to the kernel command line can cause the failure to
reproduce on that hardware as well.
