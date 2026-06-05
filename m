Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF3397B1D
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670602; cv=pass; b=DncraIbp2c9Sw89lxSFaxdzFWSKp2a2EW+wN0l3fhYSTGPGFy/001ZN48pGvyu4VK5Nkvg/35qFXCo1vfZms7iRTCSPLZyFJEPKlqs5Vwrja2uOA1Xq36jtfzswEogvlH2Med2VbTqLfq5xkjaVOkZueq2JDZKi4eRQ8gY4Gr0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670602; c=relaxed/simple;
	bh=NU7padGvN+Cok3AAtR9uOdFEwDK+h3VyBApGtoZTjgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gw/sUSbDmdeZ/QXgypaFYlsmIJTcD+a/7S9vQzFtoYwgrNMdySKvgqgmaQ9mL048YN+ayYcbtpHVmApB9Xgo2LxnpjxxpcN10UyZkLkibOIP5QCnDO7bpTy3vfOv4vHEOklXTfX45i61TRvgyhGT8PJQUv4zEd9DKntSIwgCaTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOAA6pkU; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOAA6pkU"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1364ff8099cso35689c88.0
        for <regressions@lists.linux.dev>; Fri, 05 Jun 2026 07:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780670594; cv=none;
        d=google.com; s=arc-20240605;
        b=LdBfY5hO85G0cUSNpbl9bjKnPVJEfynmIiLcZThrQUO6IVKLeVXhRA6lrzAdcdlnlh
         NZlQrg79BtIA/32QMYY5mciYm4we+Nv7FQYpTbniSjtz0qWRg4CnXC12dBgqN+L80bXX
         jOYAvO+mPz0aqZ2iuIymi696rjlt+AI92iK5JQfan22SplQmytY27JSk4eUeB/qxbkXj
         b9mwLqBmrm+Dl7sMfRup+Veh/feusaKE7J2dvMIBNEqi6qpcskZbL1bqYMsgoG1ADrdk
         zyzeH8iMej77zsPocfbs6fnvPY61kl/1IZ2YfFZ7sGaXBe8WKUZBwxEiXu1nVtdpUDlq
         4V1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zs2Tc10w1om1tJXU3BQwz8fKdjkQPd7nT9XdjGvAFtA=;
        fh=Ifwcs/WJUhe+ZqembR66RL4v9UHBjBy6HuvjRy88e08=;
        b=i4hZV56dseziv8jQOwahsQya+UrMnynifJRRzMEBPo8s4OdWkyUcYYdHQ9wGc0tZD0
         +cM+SBK32RW9gtu+tdf/BmUE93bt5uyMJSRHlgeKpnjZEEsCs86QVaNpV/ojKhYglzS+
         H7UC6SZLlusXx75j9HiPWZFIGrlnkkqQpc7onAHJuxvog+UDsmxKkMMnibTjRXyn6LsH
         1Fy9XVssYk1A5vVfY/BgXodkKkmuU0e9F0EXdKdgVjNCu62++ZVTTz3PKZf4+N+dBM48
         wsnLZTCV+wzMyHWVnfoCXnZS5AGAtXvxO6M06CnjIbHRBZN0Q36Pl9t/Dfmhdd6XkdMe
         6U7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780670594; x=1781275394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zs2Tc10w1om1tJXU3BQwz8fKdjkQPd7nT9XdjGvAFtA=;
        b=jOAA6pkUwDwd0cxrdRRvhtgayZV7b+R+KH3CvAviBeKShedjZbwrdvzIty794L9taa
         dH1mbPTcYCU2GuR1GjXpCi85ZGLszqw1r5LLJ8Ixcm6yv0sCjsYV/YrEucCXBF+nnWxB
         LAeWRTWqUHRd74A33qmYk66ubflbNt65iXU9l8SyCa0PYsi55ELglp0jLfAVVCCGg/pr
         Bc0NxF08p2llMnzP+Bi65dzvs2U+9f8doKyPy/cRL2T+h+PL0JBR7agc8eYe0oFfoJ/I
         TWPJq4WwBv6FghinHsfP9J//dZ+3Qy2LrT4QgArSbuDfse4OBXMrdGFH9VXw9XUwVLwp
         kG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670594; x=1781275394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zs2Tc10w1om1tJXU3BQwz8fKdjkQPd7nT9XdjGvAFtA=;
        b=LQvQ6rHBIWfGFCkIYCCRMRswdbI45Xz1d/EKR5ucFSElUt49BsruyZV2CaXiEuavGb
         UrfIIGbOSnLBxgEH6p86YxybQiLJc5PJDHMmmgvxTN0CNmvs3TQhwUjKyEG85bT23UKP
         jiegSxePkoGcb69BzybTFEZGJdbMgoyBDhZW+MJRhqV80yRwtokn9cooGL8HAr9+37vh
         4284NFivHaJjO2l+w/K/ZPIb5nMpcq1oPcVJ7K2Y5b2wJ6Osp0BA6UJCtlGkUdJGISEe
         ImvedfJnYJ/tlk5LbX4St55LAzpWaRwRogvKPZZaE2mpduWZVQthmRJn+RPapVmT6Yw+
         jW0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+7Zt2XQyk3xe4azR9ivQzZLnDoYe7Y+Cq12Tj1CWEc6MjTTHKgAjG+gykMx4FUqrjfNEMLsMCzRQh1dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrEf5PLcHwR1gk2h+hEg6G2hKZg4M+8Gq5+HHq0D68FD7GDOxZ
	/9YNelbovPIlRz4N+78HiZ9EQOj5MzYt63vbPyHErXd7/8zZoSgpm47oXrNt6TzL0ORSogWToek
	/il2JiBV+0VTlTBC4+ZlPEMh686p1dzI=
X-Gm-Gg: Acq92OEagWYzcP5ZUsyTPJXkqEvXUjt1wWS54Gb4o4TK4trJOMfaucCUbWJwQh4c7gn
	sNjHV9MwANRP4AUvzIZzz9YjsXCnMuDxSiz0ViVUImnVdvnyptU/WQLTkEtECssNufbxV82qOqU
	QXopfqRID3R4q8sIef1InzLoDKf/UbZ1WSAjUqbUP5nN+UereeRfk7JmHLByG6ut4qTleMqkfYx
	lIybUqS14Yb2F+sKSIPQw3sg+mhn48deq+cB/qDUnuPcKuG/inBBekpLTqQHVxTACiIzinKq2pI
	d4AHAObQNMjV+c9XkfQOi+nXv1VD9zurEOEmUNeWdK4MqZtJdUXFIvjuthCeDRPW/I4Hub06iM4
	GRqGf
X-Received: by 2002:a05:7022:407:b0:137:c0a7:8d0f with SMTP id
 a92af1059eb24-13806757572mr779741c88.5.1780670594109; Fri, 05 Jun 2026
 07:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <44069eb146824aa195312f5b02c49287@valvesoftware.com>
 <7a9021cd-fd78-4b0d-846b-135d0d72224e@mailbox.org> <16231b1742004f848af243ce398281ec@valvesoftware.com>
 <ce51243c-3b98-4f99-911f-70dd0b860da0@mailbox.org> <1c522568-1d5e-4210-8f25-1aa96e0d3c3a@leemhuis.info>
 <BL1PR12MB51447AB016BB28843BAD0216F7092@BL1PR12MB5144.namprd12.prod.outlook.com>
 <af4dff0f-0c62-4a7d-9a3f-fc029c8757f4@mailbox.org> <CADnq5_O9xMagapKQSO-6waXtmmFkDV-47ExVaNuiZd2xVdhefw@mail.gmail.com>
 <39ff584f-66ed-421a-918b-347d020a393a@mailbox.org> <399d0170414b4304823e866b04ab518a@valvesoftware.com>
 <ebe757cd-59d2-4590-b2f8-1e75a789fdb8@mailbox.org>
In-Reply-To: <ebe757cd-59d2-4590-b2f8-1e75a789fdb8@mailbox.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jun 2026 10:43:02 -0400
X-Gm-Features: AVHnY4IURXugvAuQB0M635QSjgSBCF4VFLAuGs17uisJGjQuOj-s33JKO7gRCX0
Message-ID: <CADnq5_McpRJzu1_UttS2NjnX5GRpTZG7H2oKpQ44yrQo3EOX+g@mail.gmail.com>
Subject: Re: [External Mail] Re: Test result / finding of "drm/amd/display:
 Consult MCCS FreeSync cap only if requested & supported"
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Pei-Hsin Yang <peihsiny@valvesoftware.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	"Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:42=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 6/4/26 19:21, Pei-Hsin Yang wrote:
> >
> >> Note that Pei-Hsin reported an issue when running with my fix at the s=
tart of this thread, unfortunately it's still unclear if that's a regressio=
n of > my fix or happens even without it (in which case it might be another=
 regression of the MCCS related changes for 7.1).
> >
> > As I have mentioned earlier, my testing of your patch confirms that it =
is a regression even without your patch.
>
> You previously wrote "There are other issues without your patch applied",=
 I didn't see anything about whether or not the issue you reported in the p=
ost which started this thread happens without my fix though.
>
> Anyway, thanks for confirming that it's not a regression of my fix, that'=
s a relief.
>
>
> Alex, since the MCCS changes caused other regressions, it might be better=
 to revert them for now anyway though?
>

I don't know if I'll have time to get the reverts in this week.  Your
patch is in at least.  Maybe Harry or Leo can take a look next week
when they are back in the office.

Alex
