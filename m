Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560C81B87F2
	for <regressions@lists.linux.dev>; Sat, 18 Oct 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760795462; cv=none; b=D/J4f4lWP+FIc0bZduIVODkBCHbFH1GgWrwAfnwAKww5GUqnptA/8yWTBCFaimWmYlZNau9a19b0schfX++/4B8jPMCOndsj2EzHBAWKE9T0vlOonQezawL+Rl6uzk1q5gRHpqJiCNxkNx/hZ1bQKDoFLwK4VdhC9fDriwoLWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760795462; c=relaxed/simple;
	bh=H4XC02jwzmIvWBlWZFVlD8AYAXuXdd+oXv6dBP/Y7Fw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qHiGGubhIeFFGPTtrMjxIwrmcx2FRNpCN40mU/42LVY8cOdFp/faMYLmO+69QJBAx1H5a74cRW5vMjCnR96cpvUFvECk1ib47zbNcbhXWO1h+0YDWG0hFizSRk0SexkLtwgpyOGrUxCWG3yAGfyaznW/aj02HVJcKuNDkhufNgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ3TLNQI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ3TLNQI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-426ff4f3ad4so1566433f8f.0
        for <regressions@lists.linux.dev>; Sat, 18 Oct 2025 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760795459; x=1761400259; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H4XC02jwzmIvWBlWZFVlD8AYAXuXdd+oXv6dBP/Y7Fw=;
        b=XQ3TLNQIGFSMo7A/czW5YGbvOwjJak/BvqwUFVJQ1ILU9O0g9EVOzg4RRv5oPKp9O/
         BZGc4KqSyzhvWjTueCXW7KbWhrSCqOR6rFSQSs+tTKbG7SoGPjnSrVi4j93JyOyuXDX+
         wYX9b0tJ9/03yXJh7GMpyHm9z4lWlaKxkKL0vVG4xwJBwmuf1XIwgpt/q//9sPlrFqFz
         Y16kgYbCHi2+rLbLJnYejCSxCjFnrBMHIiFs5u3UaTMRqNFnCwSo4Nn7JG20DTqnPedH
         ATPAomQDXnwgKpR8Ap5Qz1XYoxVI1mhs3HI+w6ySwRo7Ng/hqfUEqRy0913EA7JsW9no
         SbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760795459; x=1761400259;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4XC02jwzmIvWBlWZFVlD8AYAXuXdd+oXv6dBP/Y7Fw=;
        b=dIEyQM+1mXwLr3sVLGxF476nP69a7e0F2A98m9sHlTvSQ/2j+/6Zih5MVqG5lvAeG+
         hTu82LZe6QEmz1dNZAjs2PijDS1QeLMU0qL9Z0NMnjTmomkBMOob+Qd6Jd4cq3B+OeLG
         D3YOtYwjdG7uUrAMkykLq0lWrAD4Rpzeb8Non09XbfpJEDA+doSBpfcGHD2nRT2c4ANO
         na9YMYxTxrpsPMDsdCI6RLd5txoorZrDSOhdJC+ON6R+iSx90r6+hCSxULDjT8gEm7zD
         DeBp7hIajksafEhQ554obr0Lg+ydSRUH3iBSeDdVJwiMkz3XF0FCZbgaGjgBuL4p9gJ4
         0Ngg==
X-Forwarded-Encrypted: i=1; AJvYcCXjX0GFrXQN20YUKvz6jwx5eagMvQ7z1bQXjlta5NoJLM0RQ+nQICYyGlahLxmQA+uH43v9iOcJXy1N5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdKmYiCJRCPstBPeHu7TiSPc1J0X1kRJLWXkBumxUhfZHQp2Fk
	nCRhGhsIlr0cfPfjs4ezKIgTyLJ2DW8ZqBHEZ7Ept9sAS37ESxTbfo6M
X-Gm-Gg: ASbGncvSXBa7/9eFkd93Punzg6D5fhEqvwmEbNrX4YT6tiDoNOE0yZXTMSMP1rPIhI2
	fYAlLrJwNbY4gqO5aVrQoRgKUxA299ZE9ONNUzkFMTdWDGizC+Ta5R9ik0mF4QvkAmeQ9J1Pco/
	bvRWBqy86IECnslzO7jbz8mfmPwrSq7digNgEmV1l4sbLpBpHQNQiVvGlgrfCcuxgRSE3JHsTdN
	fFOxit7CNKZ/jzSmjJvrBj82RPeD2CLlEpvF9eqjVOv6cc/xUzqntDyWvg6LXMNMWGgLgO1q/8c
	M6AgmRnMlRB3EakfpON2PcAP9nB0xf3u0pDT31VZnTrAmn88gCMMG+roBL8a6S5lYHqxoR+kZay
	4x7k6YDHZMijnFzGYJlATaizKPbhfpTKj9P2Fj7YPH1hX8qT6IoguqKaIkzUGfnOI+3eoMDr4VN
	aKt/7pFRTMOP8dCw4WiJahgRvsi9FTerMy3RqauV5VvdFjDpBhFzTmUms=
X-Google-Smtp-Source: AGHT+IGCXXxrQgd1EYgtv5VJuy0v1uJ9qqFR/wWr3wDngmDs1z9Yq8rUTLutJ5vzlAyNORMZR7xTyQ==
X-Received: by 2002:a05:600c:4715:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-4711791c8c3mr54887815e9.31.1760795458332;
        Sat, 18 Oct 2025 06:50:58 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:a776:5e51:5cb5:418? ([2a02:168:6806:0:a776:5e51:5cb5:418])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47154d382d8sm48677685e9.12.2025.10.18.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 06:50:57 -0700 (PDT)
Message-ID: <10919281648e306fd3f6713437b4793c50bb6692.camel@gmail.com>
Subject: Re: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Jeff Johnson
	 <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, Baochen Qiang
	 <quic_bqiang@quicinc.com>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	regressions@lists.linux.dev
Date: Sat, 18 Oct 2025 15:50:57 +0200
In-Reply-To: <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
References: 
	<20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
	 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
	 <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
	 <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-10-17 at 08:57 -0700, Jeff Johnson wrote:
> On 10/17/2025 8:37 AM, Klaus Kudielka wrote:
> > Unfortunately, this particular commit completely breaks the ath10k driv=
er in my setup.
> >=20
> >=20
> > Hardware:
> > - Turris Omnia (arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts)
> > - Wifi card (output from lspci): Network controller: Qualcomm Atheros Q=
CA986x/988x 802.11ac Wireless Network Adapter
>=20
> This issue was previously reported with that particular chipset.
> This is currently being tracked at:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220671
>=20
> It may be useful to supply your information as a separate record to that =
bug.
>=20
> /jeff

Some more observations on that topic with the hardware shown above.

ath10k_core_start() calls ath10k_wmi_wait_for_service_ready(), and later at=
h10k_wmi_wait_for_unified_ready().

The now *unconditional* call to ath10k_hif_send_complete_check() inside ath=
10k_wmi_wait_for_service_ready()
makes the later call to ath10k_wmi_wait_for_unified_ready() fail.

If I call and handle wait_for_completion_timeout()=C2=A0first (as it was be=
fore the patch),
ath10k_hif_send_complete_check() is *not* called, and both ath10k_wmi_wait_=
for_service_ready() and
ath10k_wmi_wait_for_unified_ready() succeed. Everything is back to normal.

Side note:
ath10k_wmi_wait_for_service_ready() succeeds in both cases with time_left =
=3D=3D WMI_SERVICE_READY_TIMEOUT_HZ.


#regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=3D220671
