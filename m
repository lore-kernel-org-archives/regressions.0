Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4A931E822
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 23:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780701013; cv=none; b=m6OqbwsZMj4E/w2vy1yVvweqyjtbs5OjspBLxXMaNGBkd+3tFUTvBXMtYmpdq990jA36BZp/VyNI5kud+VX+/ErxdCYXhQau8teP65QtX4jiZs44FTjVd+xFTQmFu8MQD2cZCRkRvBvrp7avn+qDo45dDUB5FPfaK/1yTNtboz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780701013; c=relaxed/simple;
	bh=19t13Jn81pHZNk1wvOKh3LXPW/PKFGbQfsfEGYPkCoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC4R60oisywXAinGVlrsjbki+oIIXiR4bteCsSchuwLV5vEnl7jb72UkdYP8X9/3OUToQlM0jCRawkMm7EjbzcA/ShTpUhE/RTuWieOlBLw0EvayJObgtev9SgW7Ia1v35jrwCzLXk31c+MraJpjIRTEOUJgbrWfCc81e0DxpKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lQdb5WYX reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lQdb5WYX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D97DF40E01F9;
	Fri,  5 Jun 2026 23:10:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cCdF1xQxQeTP; Fri,  5 Jun 2026 23:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780700999; bh=uE8y8iDipc3Kt4NDv+9qCPuc645lRmYWq3mRcH/lIjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQdb5WYXqDVyoyEl9LRkd2A+4HE6OK4GgrK5H0651TQ7DVjOachkW7CuIHUpH4bf5
	 dYdinudfEO12oVZI1HVJetOYMlE1WZB0rNvOrL7u909eu2haM2MISFq+IhqG8rHI6r
	 LD2+aNhNYGQ/XKj05s4lJFkND4/L2vTjIYo+eoaXL6KZjXENT20jU8HyWgBRHdUlnq
	 Ktd0X+UZ0kLl/YC5R53XYzHKzNihM7OxU4qQ6bcm+sjR/bvU4UaXQ9McLH15aLxnR7
	 ldkYGLZBuJ6IjiGp4seLrgZgp2qI8cZXZeaXuPcZePUCPBR0hfbZ85+073w1+i+0By
	 4IrOo8T3GEMCxJIOeuYwKIqYWcXqlcaGxjl0QsCtA62oOJx3lLJW6Ny2+zjwVN/GB8
	 A9Npzieeq9NYgj4DgPAeOmJ0CnZ3mgyHQ3vLxPSFUxC0uLzncg+r2TpQ6NfdGbfkHC
	 6LVWh3+JEPYAJBNjdyFMXzc7c/I85YT55vn3j1Dg1h8O8HPclpEJNrAW9J+nAQJEiD
	 WZx/av8BX2pZYx4FwHQPiqV2Plo0ts1fxcu+8qUV/+NYiDCD+1Y8fLiMsvikdRl8B0
	 ikIO5OSaJSmbNshacQUDoVXh2M+u3k21GqsBClyGW4ungDMpqeTUhzUaT5dd2pPx7L
	 cDWjENxkIEa+SZOERhDb9tyY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2EEA040E0202;
	Fri,  5 Jun 2026 23:09:53 +0000 (UTC)
Date: Fri, 5 Jun 2026 16:09:49 -0700
From: Borislav Petkov <bp@alien8.de>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <20260605230949.GBaiNXPZ2ztjVL7DBg@fat_crate.local>
References: <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
 <aiMIiOzJejNV1tCL@mail-itl>
 <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
 <aiMLK1Hvk0Fmyimm@mail-itl>
 <a413be63-f7fa-4d4f-9a3e-00abbfcd7824@amd.com>
 <aiMwNrdwzlowZDNP@mail-itl>
 <20260605211543.GFaiM8f2Ee2r5hMYXW@fat_crate.local>
 <aiNF5HXO4CksO_NE@mail-itl>
 <20260605222648.GAaiNNKAr3mtWsMr7e@fat_crate.local>
 <aiNQVHXAvdVhZrZn@mail-itl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiNQVHXAvdVhZrZn@mail-itl>
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2026 at 12:40:20AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> There is nothing here that would prevent amd_smn_read() being called
> inside a guest...

Yah, there should've been...

Anyway, something like the untested below, pls give it a run.

Thx.

---
diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 0be01725a2a4..52eff7fac667 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -39,6 +39,7 @@ static struct pci_dev **amd_roots;
 /* Protect the PCI config register pairs used for SMN. */
 static DEFINE_MUTEX(smn_mutex);
 static bool smn_exclusive;
+static bool amd_node_off;
=20
 #define SMN_INDEX_OFFSET	0x60
 #define SMN_DATA_OFFSET		0x64
@@ -88,6 +89,9 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 node, u=
32 address, u32 *value, b
 	struct pci_dev *root;
 	int err =3D -ENODEV;
=20
+	if (amd_node_off)
+		return -EINVAL;
+
 	if (node >=3D amd_num_nodes())
 		return err;
=20
@@ -248,9 +252,13 @@ static int __init amd_smn_init(void)
 {
 	u16 count, num_roots, roots_per_node, node, num_nodes;
 	struct pci_dev *root;
+	int err =3D -EINVAL;
+
+	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
+		goto err_out;
=20
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
-		return 0;
+		goto err_out;
=20
 	guard(mutex)(&smn_mutex);
=20
@@ -270,7 +278,8 @@ static int __init amd_smn_init(void)
 		 */
 		if (!pci_request_config_region_exclusive(root, 0, PCI_CFG_SPACE_SIZE, =
NULL)) {
 			pci_err(root, "Failed to reserve config space\n");
-			return -EEXIST;
+			err =3D -EEXIST;
+			goto err_out;
 		}
=20
 		num_roots++;
@@ -278,13 +287,17 @@ static int __init amd_smn_init(void)
=20
 	pr_debug("Found %d AMD root devices\n", num_roots);
=20
-	if (!num_roots)
-		return -ENODEV;
+	if (!num_roots) {
+		err =3D -ENODEV;
+		goto err_out;
+	}
=20
 	num_nodes =3D amd_num_nodes();
 	amd_roots =3D kzalloc_objs(*amd_roots, num_nodes);
-	if (!amd_roots)
-		return -ENOMEM;
+	if (!amd_roots) {
+		err =3D -ENOMEM;
+		goto err_out;
+	}
=20
 	roots_per_node =3D num_roots / num_nodes;
=20
@@ -311,6 +324,10 @@ static int __init amd_smn_init(void)
 	smn_exclusive =3D true;
=20
 	return 0;
+
+err_out:
+	amd_node_off =3D true;
+	return err;
 }
=20
 fs_initcall(amd_smn_init);


--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
