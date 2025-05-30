Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FCA1F0E4F
	for <regressions@lists.linux.dev>; Fri, 30 May 2025 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748587438; cv=none; b=hs0UW/ZSg0VZRbEJcA4zTsBgW2beNLW2GqoMBMXNkna9FB0UfjVXJV0dh1YRS9I7DJmnaK07zcUzykOt97Woa/jBR6yEcl/pzOb7iotkWG1E00qe96/v27xr9HJsXPFSWE3aEnCSefHX87+Z/CClIuPuxC+WrzLjLChOcU8VRyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748587438; c=relaxed/simple;
	bh=hQpgE9FCxZY6wr0yALjhJk5QYAGAM9DyhOcet3ugtG8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=LbKB+HwETQLxUPxEaZP68SOwTouL0zpF1sI9AhfpYFqh64AoKPReb2ExP4XHo0AAHmPLWklBNTDYaEOjgWjXmnPg1B+4WvLYxCFKAaGQc5vj03d3M/RpjSNb9sYJZPXd+UGxkkOri7BrB1fIZPDfa7iAeUlQcNek0ndDv8azbA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lt+kZSvD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt+kZSvD"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so1438455a91.1
        for <regressions@lists.linux.dev>; Thu, 29 May 2025 23:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748587436; x=1749192236; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vx3EVLF/Lzm+nHRyUt2W8drMPIm6fYD3QP8+NxtAy4Q=;
        b=Lt+kZSvDxP/y4QUWLvfQK31efLPq/dD84o/s9XNKROKPIigG0tz28cWd3L9nR8LljP
         10znV35py4QmNC4Hk9zUsGsq8GxpFJFt9QRV8Xo5GXkbikMsDgb7OUQTh/k9b5XXsw/s
         lFuiZHvC/QiS9EV+567u/5KqZgpApL8Is9sVJSNdA247+JVDcg32OYC9qvRwbA1ackIB
         +ghU/KbeTbZAJoTxyB8pJP8YFiJcsoUShV0HA86BfPvDDB8JxEkoxrY6JLBxAKWHqRL4
         223UGrSsejqv54zaYlQEv4SYXBYOyjo+IRogqgluU1dTqs863mXScHdTgz1iFt+AntW7
         46/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748587436; x=1749192236;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx3EVLF/Lzm+nHRyUt2W8drMPIm6fYD3QP8+NxtAy4Q=;
        b=KQLuWonASrCk7wn5npzDRNAymYKW9X8LMDLHV7QS+AZxSNg8GKLKckL/cKb4YtJRYn
         yurQPQQFHA4/xCLApLLX8Sxh1VpqcPU/5rRYa1YFJlR0+Wc5xc2vS+Ez/61uxjL3/Wpy
         ADavsxiXzKDaKVAbb2fLNq3lMm7kxQzg66x/OU09x8oeR5WPdbvKi5iUL7inEVlRztbt
         P+cztD4M7SrmOQBFot6Sy1/OACVGPFsJ8vLSo6ON0uxanJ1kxU4x383OnIVVn1u8xyVn
         hlKp8/63rwyd9Gg9of4FlcS7hOhwjY//FG8DxZR8VtHhZmJfV9FNG375RqqaZ690uhKr
         rYgA==
X-Forwarded-Encrypted: i=1; AJvYcCXOPHpaCP0b6OUro+o44yUMesjy7fY7YnO785aVvNxnPYheozMX3Y6OCSjOWhSXvgrO3UMIDldIyjUMaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAwMl8W1r4XOFW8/v2riv7L8jJmbw5aXFXS7HeqCXReE2hjomE
	M1Yj2cY8LGEmuXTODPVN5BXk+MrR7OOOwq4xfH6LeL2GKBHH8tlz8CgZPBkYxA==
X-Gm-Gg: ASbGncsgrh79/LVQ4VsZhsyfyYvyrq1H4bfArH71ck8bykIBIfvSPxv2m9ZTCc1qgCa
	yVhj44oRybLIK1FR8WrnUJkOhzfvf7gbpJytmXHk7ZsH5pUMjlC+vUGYQz29KERMpCPxO4Y+6Ui
	oSf0OTwd8gTADhGd//vyBAXIPZrRI0fESNsneA2ih3iTidTGEFwDjd3Zi+/W1LbK6vzEGEuZsxp
	SHnAwz7mg1YH714cqeAst2TLKU391IvlZjdGpw1u52kt2GKl1rKSC4qsWiamna6LGYI5JZ0IunF
	sl7Oem4BITA/0tuc578u5dupkTHvz89HTxlefIF10TZ6Acbg3Y1fYFcs0+JzAlcdy9GGuSxFWqB
	8adafPUr0hrgHP6a0TIXc9xZXjcd4VA==
X-Google-Smtp-Source: AGHT+IGUjveKL/+AYPZ/w2nNMh65V26U7uBV/4Xki4SxCpDlysDTnfyKAkVZocmFVKyBxeKwhASJ3A==
X-Received: by 2002:a17:90b:5285:b0:312:639:a058 with SMTP id 98e67ed59e1d1-31241b8fd54mr3353064a91.27.1748587436482;
        Thu, 29 May 2025 23:43:56 -0700 (PDT)
Received: from [192.168.68.61] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf50besm21776935ad.169.2025.05.29.23.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 23:43:56 -0700 (PDT)
Message-ID: <e70e3c60-4a5e-4635-a21e-c2438abf2a5c@gmail.com>
Date: Thu, 29 May 2025 23:43:55 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: armv7 build mismatched types
From: Rudraksha Gupta <guptarud@gmail.com>
To: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
Content-Language: en-US
In-Reply-To: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Unsure why the formatting got messed up. Retrying a second time (if this 
doesn't work, please look at the logs and excuse me).


   RUSTC L rust/ffi.o
   RUSTC L rust/build_error.o
   RUSTC L rust/pin_init.o
   RUSTC L rust/bindings.o
   RUSTC L rust/uapi.o
   EXPORTS rust/exports_bindings_generated.h
   RUSTC L rust/kernel.o
error[E0308]: mismatched types
    --> rust/kernel/lib.rs:234:45
     |
234 |         $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
     |         ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*const 
drm_device`, found `*mut Opaque<drm_device>`
     |         |                        |
     |         |                        expected all arguments to be 
this `*const drm_device` type because they need to match the type of 
this parameter
     |         arguments to this function are incorrect
     |
    ::: rust/kernel/drm/device.rs:140:18
     |
140 |         unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
     |                  ------------------------------------ in this 
macro invocation
     |
     = note: expected raw pointer `*const drm_device`
                found raw pointer `*mut Opaque<drm_device>`
note: function defined here
    --> rust/kernel/lib.rs:241:8
     |
241 | pub fn assert_same_type<T>(_: T, _: T) {}
     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to 
match the `*const drm_device` type of parameter #1
     |                         |  |
     |                         |  parameter #2 needs to match the 
`*const drm_device` type of this parameter
     |                         parameter #1 and parameter #2 both 
reference this parameter `T`
     = note: this error originates in the macro `crate::container_of` 
(in Nightly builds, run with -Z macro-backtrace for more info)

error[E0308]: mismatched types
    --> rust/kernel/lib.rs:234:45
     |
234 |         $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
     |         ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut 
drm_gem_object`, found `*mut Opaque<drm_gem_object>`
     |         |                        |
     |         |                        expected all arguments to be 
this `*mut drm_gem_object` type because they need to match the type of 
this parameter
     |         arguments to this function are incorrect
     |
    ::: rust/kernel/drm/gem/mod.rs:130:20
     |
130 |         unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
     | ---------------------------------------------- in this macro 
invocation
     |
     = note: expected raw pointer `*mut drm_gem_object`
                found raw pointer `*mut Opaque<drm_gem_object>`
note: function defined here
    --> rust/kernel/lib.rs:241:8
     |
241 | pub fn assert_same_type<T>(_: T, _: T) {}
     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to 
match the `*mut drm_gem_object` type of parameter #1
     |                         |  |
     |                         |  parameter #2 needs to match the `*mut 
drm_gem_object` type of this parameter
     |                         parameter #1 and parameter #2 both 
reference this parameter `T`
     = note: this error originates in the macro `crate::container_of` 
(in Nightly builds, run with -Z macro-backtrace for more info)

error[E0308]: mismatched types
    --> rust/kernel/lib.rs:234:45
     |
234 |         $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
     |         ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut 
drm_gem_object`, found `*mut Opaque<drm_gem_object>`
     |         |                        |
     |         |                        expected all arguments to be 
this `*mut drm_gem_object` type because they need to match the type of 
this parameter
     |         arguments to this function are incorrect
     |
    ::: rust/kernel/drm/gem/mod.rs:273:29
     |
273 |         let this = unsafe { crate::container_of!(obj, Self, obj) };
     | ------------------------------------ in this macro invocation
     |
     = note: expected raw pointer `*mut drm_gem_object`
                found raw pointer `*mut Opaque<drm_gem_object>`
note: function defined here
    --> rust/kernel/lib.rs:241:8
     |
241 | pub fn assert_same_type<T>(_: T, _: T) {}
     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to 
match the `*mut drm_gem_object` type of parameter #1
     |                         |  |
     |                         |  parameter #2 needs to match the `*mut 
drm_gem_object` type of this parameter
     |                         parameter #1 and parameter #2 both 
reference this parameter `T`
     = note: this error originates in the macro `crate::container_of` 
(in Nightly builds, run with -Z macro-backtrace for more info)

error: aborting due to 3 previous errors

For more information about this error, try `rustc --explain E0308`.
make[2]: *** [rust/Makefile:538: rust/kernel.o] Error 1
make[1]: *** 
[/home/pmos/build/src/linux-next-next-20250530/Makefile:1285: prepare] 
Error 2
make: *** [Makefile:248: __sub-make] Error 2

