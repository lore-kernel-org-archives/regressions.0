Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE12E40E
	for <regressions@lists.linux.dev>; Wed,  8 Jan 2025 03:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736308452; cv=none; b=OpbNqqPF++kp2Cyz9PUW+RBiix6O7dm03tRk8bThEA7OmagrUiRT0kldfFEOTVkLwMSwDvDILc2QnQUwwg/55jaUWcGO69jLgGlyhJeotg/YgdBxJUpL78wlOmBJ43zXTfBhIjbLAVDQZm/og5NEt9nwoI3OsYEDb2LsCAmFW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736308452; c=relaxed/simple;
	bh=lOSGVE9yjk0wCEz8NOZ9xXDWuZNKDtrNmeVKat4/IsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPFMtbMt1tMpN4Oqb/d2y04p9LvJ8cM/9sCkmL+IavpLJscMObK4IeZKKAcN25jenQ6Csm1PtFvXrdZTZohzB6hoYhbdzBqc9VWq5Kjc6pycbXbcwZa+orNzGEA8xMrX+QdJ0xUUZrktms0LCDGYOttfNoiiFNLwqBjqRTdcfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gcM/YQwI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gcM/YQwI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso19389783a91.1
        for <regressions@lists.linux.dev>; Tue, 07 Jan 2025 19:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736308450; x=1736913250; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2O5SWin3/sFpJoue/uTd+xbifSjS0T2qml8CwBbWqK0=;
        b=gcM/YQwIM+IU5Eo/dKY716KHTeoD6A2l49/T73w0LtRX17+vYWdFsFUEjJasHSi9kI
         uKFVQYdFbDr85FiuAOT53/AraYCfvq5ZowtqrB97r0QPm9eZ3nhNnV9pL1TFj2LBcFAv
         1XrPM9QnpehSdcb9ngqJY1XCNmZqtMrhFYUPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736308450; x=1736913250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O5SWin3/sFpJoue/uTd+xbifSjS0T2qml8CwBbWqK0=;
        b=dcVnmyaHzJeVQdu35ckj+ltvJyIx5q/sHQJrxbZVM5sRBeNTecfcV2wYloBTdyIt7c
         8BRT/fsh1QXnCEWZeJO2KgkYWa2aTqREwxki3tkdJhnP60ypVJAoWTQpdW7zsqTJl/i6
         yK+T/xC3+5mjoCQnx7iIrPZAGv0/HbXIl7hZheT6lVL5UjF+exGNwWKoom/d5cOGohT9
         RADVpF6dx/Y8VzEl9jlStjtQSkoja4IKkVat8hMBb5/3nVZDlamx9PZ2FdJOgoVVBEaS
         KVav0nfKAxr24menmmATMRUQV6Rc1w3SJmPZtmfLLdCsNA9OkQYWV9Hta8wK0fefQe4c
         lmdg==
X-Forwarded-Encrypted: i=1; AJvYcCUnXNT1s+Lmu793paVYtNllsj1TrLyXob+qAQ02DaJi0/ZpckxRkCu6iiNh+bRXAW4qTYbq2+3OfiDn1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbtEgUDQpzAVWNxFKUdcDzZCjq1SdfyiWGugbwM6po0d0bcf7y
	Ad+cUK6AUHgyCNFSJJVU9BVR8vadxmWuskOX+2wRF9Uke1IlnAHBsRQM4qG2Iw==
X-Gm-Gg: ASbGncvfwgP1/yaCJOhAk6RhNSrA2+doutrAgiiUriOPaXVY73V+Aa56WJ4xTNMpZ4v
	BmfZ4ertZ27k0WT9iTEs9PYvUHzrtIefhF1pvDPMG/OoYQx9eLPMjWR6skkjvHxycbWwlTsh9uz
	sKy7ToVCjUm9tcgcQxS3E+zvQ4HaHa89iEhmf7AtjBaj80hIbUo902vdkq5l3zrJ/m+MH2dAP8l
	55r6HaitrbHP+W2BsMV/vh4aybZa4dnrHEENqCrOe63UQreT+WZbyC+7rGB
X-Google-Smtp-Source: AGHT+IGR9RMGVfvKzrXA23qhdUrf15++8XYlmKfVl2E/o3+ke5XoUfDua9ueeLTK2ok7oQatmri8bA==
X-Received: by 2002:a17:90b:4c8d:b0:2ee:db8a:29d0 with SMTP id 98e67ed59e1d1-2f5490bab2cmr1869590a91.26.1736308450484;
        Tue, 07 Jan 2025 19:54:10 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:57ef:1197:3074:36c2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2656aasm399145a91.8.2025.01.07.19.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:54:09 -0800 (PST)
Date: Wed, 8 Jan 2025 12:54:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Kenneth Van Alstyne <kvanals@kvanals.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	senozhatsky@chromium.org, minchan@kernel.org, ngupta@vflare.org
Subject: Re: zram: Regression in at least linux-6.1.y tree
Message-ID: <7rferqxnhaa4rgpgmwm3ulhssdvnxhzz7fyjo3u2fmw3jyqgjw@oimhw7h6idf2>
References: <010001944286f97d-fe02c461-e7af-4644-9155-a96995709804-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010001944286f97d-fe02c461-e7af-4644-9155-a96995709804-000000@email.amazonses.com>

On (25/01/07 20:48), Kenneth Van Alstyne wrote:
> Kernel 6.1.122 introduced a regression via commit
> ac3b5366b9b7c9d97b606532ceab43d2329a22f3 (backport of upstream
> commit 74363ec674cb172d8856de25776c8f3103f05e2f)

We better drop that patch from stable, I didn't want it to be
in stable because the patch didn't fix any real issues that
affected any users.

> in drivers/block/zram/zram_drv.c where attempting to set the size
> of /dev/zram0 after loading the zram kernel module results in a
> kernel NULL pointer dereference.

[..]

> Steps to reproduce:
> 
> 	modprobe zram
> 	zramctl /dev/zram0 --algorithm zstd --size 83886080k

Not sure if "regression" is the right word, that zramctl is deemed
to fail, it's just on older kernels error-out path is now oops-y.
Regardless of that, we better drop that patch.
