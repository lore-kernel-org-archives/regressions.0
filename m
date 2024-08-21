Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB83D4778E
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 01:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724203999; cv=none; b=cTxMwlsVB6PSovquOF+y1krEE+mGCaXDxuVn23jmkxTY02iHAKqpVBj+QGUnmbPnbr2AEY7yzb9E2mzAkKcUdrAvuhNbJGDseaArq/4OndNDOTdQqVI4dep9BxE87uKbU3V9RbEiLOvpmMK8867GdImu58Zlt4Hlaa0JRg/6Y9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724203999; c=relaxed/simple;
	bh=TVozaWtR1PMKJJ2DJx8WYtFk8+BhPIloZFUmV+h063U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lMaLfI8lcebVA2i7d5TYWFIR/X3iHl23K1B6PQC8EDjuHmbxqHtnz89foNUxTqJ9REXmPj5vwodvzHu1XJ1BczjNDNXkgk+Md4lwk9yZKr8AkUJcMcy2hBfdzTfe6pIFSRn1Y0EeVtSITq4OGGVMCRt56p7avyNlVz4CZQ4jRq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVwaYBav; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVwaYBav"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5d5e1c86b83so3943382eaf.3
        for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724203997; x=1724808797; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TVozaWtR1PMKJJ2DJx8WYtFk8+BhPIloZFUmV+h063U=;
        b=WVwaYBavmayoZ6QOTXo+xFfWaIptFoqr1n2KPhJFr3kUFA+VzFUeUTAuk/gaGmmz+1
         HzcxIBB0CE937PkzldksLihOFI1ieYPfCyklYGg5Sjkub+dDy5h65nNq71UgF23GqZUG
         X63i5QCqnYjnjvxD6sISlUOu0lL+tx2Ab7DJg0WM9CBCAz5xlvh+G31mkIQwmVwM01Cd
         EVBZKFcp3dqHB8pimP9g7fg5i81zancU2MgrIqyEyHHck2oYCHMQNOHP9lkAGMwUnBDP
         zD0W5MfA6I5MUJli5PrWyPTtjp1P73IMuwsxbPL2k8AbGf9wvvTZAQGgG+5BoaU5yBdK
         KnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724203997; x=1724808797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TVozaWtR1PMKJJ2DJx8WYtFk8+BhPIloZFUmV+h063U=;
        b=FdcvpZMs/wcNYAfR363DMWPCrcScaqXOdlQ/tvkDLLfbaKmtOPbdjuAAjwSUpD+EhH
         vn3pzX0GMYBlJtarRLjJUumyGe+phF1TZkAqc/Gg6P8g2/VEoPbhIQ/iPwzsiOnlzVuy
         lDj1D+PIUG37vkdmd46WhUASXh/QOLH5KZ5cDQCdb8A/ODwL3xedRBwiNco/qLXv1dFl
         uZSFMd/9B+a6SoCv+x8WagE6uidNBCFF2RiEpbSiWZ0cftiyBRcMQ3lO/6eOmE5J21rR
         HcTcd5Em1hPeQZcqTbhq/F8mM1vfiHCNCQ0oe/TmggSIC118jNHYdv8OhPwNgWCHYbDy
         c+hA==
X-Gm-Message-State: AOJu0YzLmwacjCPMP2/8HL6vkMAmHzJPWS332XL51vcKDiLNTXCH49Sr
	Xd+ybZAb6bobbW26LgtjYT4m9oFIlKZrSpj71qpeI1lPI//ek1RV
X-Google-Smtp-Source: AGHT+IE1kzwvIGqsTUReVp+W70RugwByu2Io0zMFp8r1glHtNYXZClYMXgt3mQ/S3Og1YfGV/mOO4Q==
X-Received: by 2002:a05:6358:8096:b0:1ac:ed54:224d with SMTP id e5c5f4694b2df-1b5a287043fmr65787955d.11.1724203996707;
        Tue, 20 Aug 2024 18:33:16 -0700 (PDT)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af18937sm8853894b3a.150.2024.08.20.18.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 18:33:16 -0700 (PDT)
Message-ID: <badd583d09868ffdd48a97c727680ca6f5699727.camel@gmail.com>
Subject: Re: KASAN: null-ptr-deref in bpf_core_calc_relo_insn
From: Eduard Zingerman <eddyz87@gmail.com>
To: Liu RuiTong <cnitlrt@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 20 Aug 2024 18:33:11 -0700
In-Reply-To: <CAK55_s6do7C+DVwbwY_7nKfUz0YLDoiA1v6X3Y9+p0sWzipFSA@mail.gmail.com>
References: 
	<CAK55_s6do7C+DVwbwY_7nKfUz0YLDoiA1v6X3Y9+p0sWzipFSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTA4LTIwIGF0IDE3OjIxICswODAwLCBMaXUgUnVpVG9uZyB3cm90ZToKClsu
Li5dCgo+IGJwZl9jb3JlX2NhbGNfcmVsb19pbnNuKzMxMSAgICAgICAgICAgIDxicGZfY29yZV9j
YWxjX3JlbG9faW5zbiszMTE+Cj4g4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSAWwo+IFNPVVJDRSAoQ09ERSkgXeKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgAo+IEluIGZpbGU6IC9ob21lL3VidW50dS9m
dXp6L2xpbnV4LTYuMTEtcmM0L3Rvb2xzL2xpYi9icGYvcmVsb19jb3JlLmM6MTMwMAo+ICAgIDEy
OTUgICAgICAgICBjaGFyIHNwZWNfYnVmWzI1Nl07Cj4gICAgMTI5NiAgICAgICAgIGludCBpLCBq
LCBlcnI7Cj4gICAgMTI5Nwo+ICAgIDEyOTggICAgICAgICBsb2NhbF9pZCA9IHJlbG8tPnR5cGVf
aWQ7Cj4gICAgMTI5OSAgICAgICAgIGxvY2FsX3R5cGUgPSBidGZfdHlwZV9ieV9pZChsb2NhbF9i
dGYsIGxvY2FsX2lkKTsKPiAg4pa6IDEzMDAgICAgICAgICBsb2NhbF9uYW1lID0gYnRmX19uYW1l
X2J5X29mZnNldChsb2NhbF9idGYsCj4gbG9jYWxfdHlwZS0+bmFtZV9vZmYpOwoKSGkgTGl1LAoK
VGhhbmsgeW91IGZvciB0aGUgcmVwb3J0LCBJIGNhbiByZXByb2R1Y2UgdGhlIGlzc3VlLgpXaWxs
IGNvbW1lbnQgbGF0ZXIgdG9kYXkuCgo+ICAgIDEzMDEgICAgICAgICBpZiAoIWxvY2FsX25hbWUp
Cj4gICAgMTMwMiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgMTMwMwo+ICAg
IDEzMDQgICAgICAgICBlcnIgPSBicGZfY29yZV9wYXJzZV9zcGVjKHByb2dfbmFtZSwgbG9jYWxf
YnRmLCByZWxvLAo+IGxvY2FsX3NwZWMpOwo+ICAgIDEzMDUgICAgICAgICBpZiAoZXJyKSB7Cj4g
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSAWwo+IFNUQUNLIF3ilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIAKPiBgYGAKCgo=

